Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4356B763FF2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 21:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjGZTuc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 15:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjGZTub (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 15:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067B5189
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 12:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690400984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7Idb8UnTmHWFQ6e9XeN95NGwXrVTgOeFRSIgTo8gQY=;
        b=WnDY6bYLAZbUxLrgT5k/zdnh7juz2hi1IeICkriJckTnforRU508MMw0fXuNbzJMnllpEJ
        7PvF//QE76MGSB5Z+vD08ZWwEwgYlTSZDeuOAoOH02BaPA0M6oJoXPen4ZlRyIDmA+0jxW
        5INS4VrQdQtF+vdvFGyO5m0nZ9CVbSM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-Se0l-npVOAanfn9NNCQ1yg-1; Wed, 26 Jul 2023 15:49:42 -0400
X-MC-Unique: Se0l-npVOAanfn9NNCQ1yg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98e40d91fdfso3716466b.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 12:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690400981; x=1691005781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7Idb8UnTmHWFQ6e9XeN95NGwXrVTgOeFRSIgTo8gQY=;
        b=EgcbHl2I3oIW1SMiuQAF0GI5ZnnZBrOOpHdZy0HZtc6ElTPnbBJ6t4J5Wwf31a9TZC
         S0M7HcBRJFA10bTM7RgRooIoKN0uyujSqYgPwUh60OXl231P0ipNfJxrLLAjY7eEJnAW
         iG30Ofoy5YGQq5KB4io5/atEOOBhowK/k78gdYiojc3Xlm2rU2VtNb3vbBU4fGgj+JM4
         Us5pL6Y0ZlHpub/7lY/7tx1btf4ie90IZT/T9c+3P/cSAAE71pnVxwE+Xh1vIEXzKIXT
         PzZ+PgtKiyfVVt9ZmZamSYszg4gLaqFj05SLDqTpq5tQWcBl6/v35VGAGRUFiJncxzWM
         PaIQ==
X-Gm-Message-State: ABy/qLaUekpZ14qPPXoOgtGuAyK/Q3GmBxDA2c4zsbET0SdNpL/9pJdZ
        PYeLNTlxObObdcZTzvowEvxPImO/zRdfsIW1Q8L5bPd0lRc9NKKPhnqCDHDicUWY0R95IL4YlMX
        7NXhJy2pwp8M8XqDLW7wi
X-Received: by 2002:a17:907:2be4:b0:993:e691:6dd5 with SMTP id gv36-20020a1709072be400b00993e6916dd5mr160981ejc.7.1690400981640;
        Wed, 26 Jul 2023 12:49:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGtjEVVf36IhSTspsZ3AQVtc7mXvm+lx88lxam8fjNHDqAi6nVllIEtEDae1iK04Jdl3tO90A==
X-Received: by 2002:a17:907:2be4:b0:993:e691:6dd5 with SMTP id gv36-20020a1709072be400b00993e6916dd5mr160965ejc.7.1690400981365;
        Wed, 26 Jul 2023 12:49:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lc28-20020a170906dffc00b0098e422d6758sm9966745ejc.219.2023.07.26.12.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 12:49:40 -0700 (PDT)
Message-ID: <b82bec27-f750-19e7-f133-3ea615d2a438@redhat.com>
Date:   Wed, 26 Jul 2023 21:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] usb: dwc3: pci: skip BYT GPIO lookup table for
 hardwired phy
To:     Gratian Crisan <gratian.crisan@ni.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        gratian@gmail.com
References: <20230726184555.218091-2-gratian.crisan@ni.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230726184555.218091-2-gratian.crisan@ni.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/26/23 20:45, Gratian Crisan wrote:
> Hardware based on the Bay Trail / BYT SoCs require an external ULPI phy for
> USB device-mode. The phy chip usually has its 'reset' and 'chip select'
> lines connected to GPIOs described by ACPI fwnodes in the DSDT table.
> 
> Because of hardware with missing ACPI resources for the 'reset' and 'chip
> select' GPIOs commit 5741022cbdf3 ("usb: dwc3: pci: Add GPIO lookup table
> on platforms without ACPI GPIO resources") introduced a fallback
> gpiod_lookup_table with hard-coded mappings for Bay Trail devices.
> 
> However there are existing Bay Trail based devices, like the National
> Instruments cRIO-903x series, where the phy chip has its 'reset' and
> 'chip-select' lines always asserted in hardware via resistor pull-ups. On
> this hardware the phy chip is always enabled and the ACPI dsdt table is
> missing information not only for the 'chip-select' and 'reset' lines but
> also for the BYT GPIO controller itself "INT33FC".
> 
> With the introduction of the gpiod_lookup_table initializing the USB
> device-mode on these hardware now errors out. The error comes from the
> gpiod_get_optional() calls in dwc3_pci_quirks() which will now return an
> -ENOENT error due to the missing ACPI entry for the INT33FC gpio controller
> used in the aforementioned table.
> 
> This hardware used to work before because gpiod_get_optional() will return
> NULL instead of -ENOENT if no GPIO has been assigned to the requested
> function. The dwc3_pci_quirks() code for setting the 'cs' and 'reset' GPIOs
> was then skipped (due to the NULL return). This is the correct behavior in
> cases where the phy chip is hardwired and there are no GPIOs to control.
> 
> Since the gpiod_lookup_table relies on the presence of INT33FC fwnode
> in ACPI tables only add the table if we know the entry for the INT33FC
> gpio controller is present. This allows Bay Trail based devices with
> hardwired dwc3 ULPI phys to continue working.
> 
> Fixes: 5741022cbdf3 ("usb: dwc3: pci: Add GPIO lookup table on platforms without ACPI GPIO resources")
> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> ---
> V1 -> V2: Remove redundant NULL check

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
>  drivers/usb/dwc3/dwc3-pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> index 44a04c9b2073..6604845c397c 100644
> --- a/drivers/usb/dwc3/dwc3-pci.c
> +++ b/drivers/usb/dwc3/dwc3-pci.c
> @@ -233,10 +233,12 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc,
>  
>  			/*
>  			 * A lot of BYT devices lack ACPI resource entries for
> -			 * the GPIOs, add a fallback mapping to the reference
> +			 * the GPIOs. If the ACPI entry for the GPIO controller
> +			 * is present add a fallback mapping to the reference
>  			 * design GPIOs which all boards seem to use.
>  			 */
> -			gpiod_add_lookup_table(&platform_bytcr_gpios);
> +			if (acpi_dev_present("INT33FC", NULL, -1))
> +				gpiod_add_lookup_table(&platform_bytcr_gpios);
>  
>  			/*
>  			 * These GPIOs will turn on the USB2 PHY. Note that we have to

