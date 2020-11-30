Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1667D2C8160
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 10:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgK3JuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 04:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726249AbgK3JuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 04:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606729725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tPvt5Fze9oePySh23BCqzPG4KjGI8dK/uioZmRf36R0=;
        b=C+wJ0kQvjtVCvjR20IEZGBKE10DAE4HaAqieHw9sX4bTkJ/CxPCdTWCIT9e8TbIq3sPZjf
        nbMPWIch7mTmZzSHcqYoX9rNek9Mjxzxur/SGDwyRVte4xf22vIeDCcKR1dLpgn5FvCygz
        HKYeRgsl9ckQIoJKk91tpv20bYQfZ9s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-o_Yg_2egNJy_soBH_ax9jw-1; Mon, 30 Nov 2020 04:48:43 -0500
X-MC-Unique: o_Yg_2egNJy_soBH_ax9jw-1
Received: by mail-ej1-f69.google.com with SMTP id a8so5498575ejc.19
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 01:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tPvt5Fze9oePySh23BCqzPG4KjGI8dK/uioZmRf36R0=;
        b=Hidx5b5FypLZBlol2mbcD877c/uxK1kMkqgde75QIseA6iCBQ8WJKKzuP9aI3chaWn
         MH/05vXloV5jGY9ROuGS1lKPPV/WxTq8egS3DzJToDu8cEC9DDeXKLvtr0XCcEc69km2
         yAp0eE5mUXoqUsCHUC2656UcI85Wc1mUVZ414s93ucUBQdbvWwX3wRd2PVp4R4faRLSz
         9wLyHzeRXU8pceWAp2GQQwPZLawjjTknAGuO4Zd5kzh9En4f1gj7zt7X02IqVP3qhVg+
         QlGxA6U3QAcxeVUC8NJppkpeW6CH1S22DL+qUjASsD7hIZ1C/Ek4U690wc0Vtve8h/Am
         ZkUA==
X-Gm-Message-State: AOAM532Tu/FD5nnim0q5ciaN8k4J4BrP/qDiQwr19QyvlUxQWHeUkk4/
        D8HRYdiRI0d6Is/aRtw97bb2GXipIuqaCMHfTn1YFHXGNu/ylci6+A2aim7wQrGIax5ASqdywRy
        smrkHJV489hzukNMtW8G+
X-Received: by 2002:a17:906:470a:: with SMTP id y10mr17599177ejq.180.1606729722711;
        Mon, 30 Nov 2020 01:48:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdlAzbk5hlkROC5+9ochugF0OWYYO091mqBJkAEk4CCgyNyUe0/uBeXhDUaExIqPmKu1O1ZQ==
X-Received: by 2002:a17:906:470a:: with SMTP id y10mr17599165ejq.180.1606729722558;
        Mon, 30 Nov 2020 01:48:42 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k11sm8850492edh.72.2020.11.30.01.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 01:48:41 -0800 (PST)
Subject: Re: [PATCH 1/2] uas: revert from scsi_add_host_with_dma() to
 scsi_add_host()
To:     Tom Yan <tom.ty89@gmail.com>, hch@lst.de,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, baolu.lu@linux.intel.com
References: <09992cec-65e4-2757-aae6-8fb02a42f961@redhat.com>
 <20201128154849.3193-1-tom.ty89@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <62e0d5ea-e665-b913-5482-a75db0ac1368@redhat.com>
Date:   Mon, 30 Nov 2020 10:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128154849.3193-1-tom.ty89@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/28/20 4:48 PM, Tom Yan wrote:
> Apparently the former (with the chosen dma_dev) may cause problem in certain
> case (e.g. where thunderbolt dock and intel iommu are involved). The error
> observed was:
> 
> XHCI swiotlb buffer is full / DMAR: Device bounce map failed
> 
> For now we retain the clamp for hw_max_sectors against the dma_max_mapping_size.
> Since the device/size for the clamp that is applied when the scsi request queue
> is initialized/allocated is different than the one used here, we invalidate the
> early clamping by making a fallback blk_queue_max_hw_sectors() call.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>

I can confirm that this fixes the network performance on a Lenovo Thunderbolt
dock generation 2, which uses an USB attach NIC.

With this patch added on top of 5.10-rc5 scp performance to another machine
on the local gbit LAN goes back from the regressed 1 MB/s to its original 100MB/s
as it should be:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/usb/storage/uas.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index c8a577309e8f..5db1325cea20 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -843,18 +843,21 @@ static int uas_slave_alloc(struct scsi_device *sdev)
>  static int uas_slave_configure(struct scsi_device *sdev)
>  {
>  	struct uas_dev_info *devinfo = sdev->hostdata;
> -	struct device *dev = sdev->host->dma_dev;
> +	struct usb_device *udev = devinfo->udev;
>  
>  	if (devinfo->flags & US_FL_MAX_SECTORS_64)
>  		blk_queue_max_hw_sectors(sdev->request_queue, 64);
>  	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
>  		blk_queue_max_hw_sectors(sdev->request_queue, 240);
> -	else if (devinfo->udev->speed >= USB_SPEED_SUPER)
> +	else if (udev->speed >= USB_SPEED_SUPER)
>  		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
> +	else
> +		blk_queue_max_hw_sectors(sdev->request_queue,
> +					 SCSI_DEFAULT_MAX_SECTORS);
>  
>  	blk_queue_max_hw_sectors(sdev->request_queue,
>  		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> -		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
> +		      dma_max_mapping_size(udev->bus->sysdev) >> SECTOR_SHIFT));
>  
>  	if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
>  		sdev->no_report_opcodes = 1;
> @@ -1040,7 +1043,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	shost->can_queue = devinfo->qdepth - 2;
>  
>  	usb_set_intfdata(intf, shost);
> -	result = scsi_add_host_with_dma(shost, &intf->dev, udev->bus->sysdev);
> +	result = scsi_add_host(shost, &intf->dev);
>  	if (result)
>  		goto free_streams;
>  
> 

