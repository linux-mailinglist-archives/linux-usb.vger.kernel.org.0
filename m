Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5786A38F88F
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 05:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhEYDOE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 23:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhEYDOB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 23:14:01 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B6FC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 20:12:31 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id o192so15312426vsd.7
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 20:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hh7q+u3PQs9FnCxo0AI97z4AFr42pPhmERTNRWxYl0c=;
        b=pPXJSdf1rv8WcUA+8rxTpsWTTY/1xJu459KUDSraz0BvARuyDptlGU7qL5L/isPq+a
         2rmpSzPpaA+iEDOXysTVWR4m5H1ClEhPlBFApVxWczHVFk4/uQvcl7LpYlXVGxL6NJb+
         j8SN5ITdF7sSfCrDQCW1fjqiiqL1mUsT6th9/qQ08V380C/xr0sUFL4xNGTfkT2pk5qc
         y7cfQnInqzZ/C6ae2h5gANNI/GuCEvo/RvHo4WsYr+d0+fmYK9JHLUxb5Vz2M4W0/9cT
         MNDEv0U95sLCbVG03876RoHCYsv5qvzkHM3sZBryNzw9DlLgWXInbxg1NVwXErXmBv/k
         lZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hh7q+u3PQs9FnCxo0AI97z4AFr42pPhmERTNRWxYl0c=;
        b=pAFWMqIMA81if4sim/Sj9uDxMcCdr2X92GU/jlMRmM95GAUpH7+hNQRyuWTBLvOGum
         Sy+4947e5Qrv/18M2HPyeP72GPsVrHgAPFOumaFJ/wxl9T0OTrLhuCBKGnZplW/h+JG9
         ZdXEAiMKDsNQMknROmfW9piAp23nV/P9Zb96/thpnLCA2U0rUKiba/C802MOsHXtqoQs
         Yt6u6864v42oA4HRAhxGAogFQSm5bhEIqn6D71TjeRABNlMqsZ83GRQU9tOXmFJmzJGm
         SPAcyE6Hi7fVpFqGo1GF4jmVfQ8djlWtaQ39F+ZU1/ZyxmDZ21lCkKqBftGGWPcsSlIs
         Clng==
X-Gm-Message-State: AOAM533DTbJcbziuiH1p3HdxYQPlRJT/0IttcqtYRwztWu0oDkAKnQLD
        ms5XCnfYHBHj39nB5qEEy18SAA+8lWMNzeuh87rdrg==
X-Google-Smtp-Source: ABdhPJzDNKuzhu/VY8WMVLKih3X9JxaBhy4/5X7QuXPBaO7TvjQysRGO/wkZZ+5IjcGaLvnzDWJWHbChjgKdSmzQ/Y8=
X-Received: by 2002:a67:d71e:: with SMTP id p30mr25147437vsj.25.1621912350170;
 Mon, 24 May 2021 20:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210524133704.2432555-1-weiyongjun1@huawei.com>
In-Reply-To: <20210524133704.2432555-1-weiyongjun1@huawei.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 24 May 2021 20:11:53 -0700
Message-ID: <CAPTae5K=4NpOanziQWA7RmdxYrxwwgfKixKi1SG6LrMZcCh=0w@mail.gmail.com>
Subject: Re: [PATCH -next] usb: typec: tcpci: Make symbol 'tcpci_apply_rc' static
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 24, 2021 at 6:26 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The sparse tool complains as follows:
>
> drivers/usb/typec/tcpm/tcpci.c:118:5: warning:
>  symbol 'tcpci_apply_rc' was not declared. Should it be static?
>
> This symbol is not used outside of tcpci.c, so marks it static.
>
> Fixes: 7257fbc7c598 ("usb: typec: tcpci: Implement callback for apply_rc")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 34b5095cc84f..22862345d1ab 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -115,7 +115,8 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>         return 0;
>  }
>
> -int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc, enum typec_cc_polarity polarity)
> +static int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc,
> +                         enum typec_cc_polarity polarity)
>  {
>         struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>         unsigned int reg;
>
