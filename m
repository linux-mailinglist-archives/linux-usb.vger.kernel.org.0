Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B4E7285D7
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 18:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjFHQzO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 12:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjFHQzN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 12:55:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A59D1725
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686243270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C7Gzsm4c5VDydfTjmb7wRGtHYG5sGvTAth2UOQdT5as=;
        b=FAWhPdGU8KB0hnGdLt7RjZT7zQlzW6fuvUWbRD4lhHdWJkRPFMKnmsE8F4STpBiYQLYjKn
        EzEPXTlAjru0pTuTJ5a0FMKTqFCtMWlW6sLvp3XUta6wxD3LUx8pqktH/qj4fiRC/HJCQG
        QM4agK7cFbI8NBHCEmrCDezPqHQxSew=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-SaQN-UswOq-dnUsu78t3Mw-1; Thu, 08 Jun 2023 12:54:27 -0400
X-MC-Unique: SaQN-UswOq-dnUsu78t3Mw-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-55b15c956e2so693509eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jun 2023 09:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686243267; x=1688835267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Gzsm4c5VDydfTjmb7wRGtHYG5sGvTAth2UOQdT5as=;
        b=U6IICYT55XwiZ/h8rkObvLSruTMv7EW9ZJx35RZfkyG+lkRzv+ddjuUtKFuZxzYjNc
         SHQNEbhCMwOd/v00QZwrejFCqvmmg4XWB9QBe3zF9slAPTdRqe29Upd4cJg8SDkqoIH4
         /Q25iPviaZKfn7T+1hXnFRSy8kWOfSNI9yEDlNbPoxEyuN0fQGa99NLenKyU/K1h9Wwz
         FS2yq9E2rh4e7JeBZKkyLLFqUKI7dilfFj1/xGRB5t82T5Xssti6yXSSwAufmT3NJ886
         4TRxwJdxCDt6AqyvBnBY2Wrmr2E1oQQ8JDTxQTI/P4XfYoWk1TYMgkph/mK6833Xh5sE
         pdmw==
X-Gm-Message-State: AC+VfDw4K/bHAXdYTBuZxkhLwjO91do9rc8N9DQkapjH6FWjz0L6eS7F
        48dm1JQSI5ruCL2LGGEft9xrkbUi9rtDJ6IZFS3VXqyORQaPy04dIAuJTfoxQp8NMm1Numzu4kw
        oeyFvntphlN1rfPKOxwMQ
X-Received: by 2002:a4a:d8c2:0:b0:558:fd2b:8232 with SMTP id c2-20020a4ad8c2000000b00558fd2b8232mr177812oov.9.1686243266856;
        Thu, 08 Jun 2023 09:54:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JTBAHmdb92kjvDywymq4EZWiP3V+16ZVHXuhLLjDlkHPWSSDhtIhwSdfuR/7p2MS+ahpNvw==
X-Received: by 2002:a4a:d8c2:0:b0:558:fd2b:8232 with SMTP id c2-20020a4ad8c2000000b00558fd2b8232mr177798oov.9.1686243266617;
        Thu, 08 Jun 2023 09:54:26 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id z2-20020aca3302000000b0038ee0c3b38esm599397oiz.44.2023.06.08.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:54:25 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:54:23 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Fix an error handling path in
 dwc3_qcom_probe()
Message-ID: <20230608165423.gvcwvmgiojuvjahv@halaney-x13s>
References: <b69fa8dd68d816e7d24c88d3eda776ceb28c5dc5.1685890571.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b69fa8dd68d816e7d24c88d3eda776ceb28c5dc5.1685890571.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 04, 2023 at 04:56:34PM +0200, Christophe JAILLET wrote:
> If dwc3_qcom_create_urs_usb_platdev() fails, some resources still need to
> be released, as already done in the other error handling path of the
> probe.
> 
> Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 822735814050..aa96c473f839 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -856,9 +856,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			if (IS_ERR_OR_NULL(qcom->urs_usb)) {
>  				dev_err(dev, "failed to create URS USB platdev\n");
>  				if (!qcom->urs_usb)
> -					return -ENODEV;
> +					ret = -ENODEV;
>  				else
> -					return PTR_ERR(qcom->urs_usb);
> +					ret = PTR_ERR(qcom->urs_usb);
> +				goto clk_disable;
>  			}
>  		}
>  	}
> -- 
> 2.34.1
> 

