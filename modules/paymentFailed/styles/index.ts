import styled from 'styled-components'

export const PaymentFailedMainContainer = styled.div`
  width: 100%;
  min-height: calc(100vh - 184px);

  .row {
    min-height: calc(100vh - 184px);
  }
  .title {
    width: 100%;
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }
  .icon {
    color: red;
  }
  .card-link {
    padding: 0 14px !important;
    height: 30px;
  }
`
