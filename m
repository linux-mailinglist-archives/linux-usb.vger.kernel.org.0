Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9828728600
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 19:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbjFHRK5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 13:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbjFHRKz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 13:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307492D41
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686244198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9z7T6Wkk/SdazHdjYQuKgRjHWVMoXTStQH+SQPSaOwc=;
        b=LllZoeeJs8Y/b/K10tUZkZv3lqwDE/CbjBDwVO/Q0xGHMMMHd2rcrYwU4+MOvMTy5D13zl
        CrKT3NuJK9MLuEoj/r6/PEdl3IeYAmxEhGMID06Om+h80YpX0cONp3aNz+05NYsH03MQsd
        xHCAzRgP1r55Omihg1ucW8UguTY4uiM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-0BdvcqLNPU2BWMWmp7X07A-1; Thu, 08 Jun 2023 13:09:57 -0400
X-MC-Unique: 0BdvcqLNPU2BWMWmp7X07A-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-56991d8e2b0so9974997b3.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Jun 2023 10:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686244196; x=1688836196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z7T6Wkk/SdazHdjYQuKgRjHWVMoXTStQH+SQPSaOwc=;
        b=TU7SpEjLVzOw1CPn/EuebvfSVdAgPPhzI11f1Bk07jgTxO1rW3dpwAz+neiREiFRMw
         tiGv5JtiGn6/SZ9bqAcTcjlFbRiQMrjL0857ptrsSs6U8CnXiozDSqMi0OVixjuUIpTR
         Zh6Ih7xBdAQszPR5KsCAXjAX78ukOiPjlzuydnyb7J+mJYj7rZiQeNKcCjIcWwmdr0fb
         V2WiaJfqQJ5ooBfsw6L0a1KAAli//ZOxLXG/ErI0dDAo1CfQzEke1QW3LoIgK5n8BZ2S
         y3AAJ+zD2JMpMZkwR3DAdJ44oXUIfe2D6LrvfM3rusnYNif8CHBpXBnYM+X9C9TcKtpY
         RiIg==
X-Gm-Message-State: AC+VfDwNkC136QaWg1bNtsh1kVUNkDfXcSu/D8A7s7CUE73mikrXFORP
        e0Nq/U1su77v8EkIgFq2iDn3H1B6hywKcZSMUo6shEGiHFwTG4WiMsG3jA8g7fUo6QdFaERZW1d
        DKepYSBTlKg6Zi7+5QRsEGCrnwNEn
X-Received: by 2002:a0d:cf84:0:b0:565:9a3d:a3f9 with SMTP id r126-20020a0dcf84000000b005659a3da3f9mr410773ywd.9.1686244196440;
        Thu, 08 Jun 2023 10:09:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4wmKzTc3/7wkPTGewfNcd0v7EPf3urCf81xQmG/YbMBi+ovkuVi0bLM1/xnxOeu7n6SLkXsw==
X-Received: by 2002:a0d:cf84:0:b0:565:9a3d:a3f9 with SMTP id r126-20020a0dcf84000000b005659a3da3f9mr410744ywd.9.1686244196191;
        Thu, 08 Jun 2023 10:09:56 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id k1-20020a819301000000b00555c30ec361sm21993ywg.143.2023.06.08.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 10:09:55 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:09:53 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Release the correct resources in
 dwc3_qcom_remove()
Message-ID: <20230608170953.nbemo4cuipq5ui7h@halaney-x13s>
References: <c0215a84cdf18fb3514c81842783ec53cf149deb.1685891059.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0215a84cdf18fb3514c81842783ec53cf149deb.1685891059.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 04, 2023 at 05:04:37PM +0200, Christophe JAILLET wrote:
> In the probe, some resources are allocated with
> dwc3_qcom_of_register_core() or dwc3_qcom_acpi_register_core(). The
> corresponding resources are already coorectly freed in the error handling

nit not worthy of holding this up: s/coorectly/correctly/

> path of the probe, but not in the remove function.
> 
> Fix it.
> 
> Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks,
Andrew

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index aa96c473f839..9c95f1d909ba 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -942,11 +942,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  static void dwc3_qcom_remove(struct platform_device *pdev)
>  {
>  	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> +	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
>  	int i;
>  
>  	device_remove_software_node(&qcom->dwc3->dev);
> -	of_platform_depopulate(dev);
> +	if (np)
> +		of_platform_depopulate(&pdev->dev);
> +	else
> +		platform_device_put(pdev);
>  
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> -- 
> 2.34.1
> 

