Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4DA212D2F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 21:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgGBTgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 15:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgGBTgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 15:36:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3503C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 12:36:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z13so29835814wrw.5
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=58oTnMT/MtJjFomhQl6lhOwVpv84uZYmbhCZv0q9vVw=;
        b=QMPc7KmYrF+cR0jlMDxlE0P++W3Ib6D9Q6hCBb+FX8DUwCOONAj4mwZUKuqx8Lo1lc
         JZG2ndUBnuMS54RGcjQfW3PK5hpCmlqT8gJDY8VQiWqGKUowtZkThjjOPKze907ga28H
         YgjRVLqp71d8dx+BBDBTsI8E8SK72LgOmqhedek3H/PCqPkmiae3dRsOppAGvSinj8+y
         p4pPKElEnjnALpQZg1tGdQg5nQu6E0FXrB70l1A+P0Oei5XIk00SnLB5DhIf8Bxji1K9
         GLUotKj9Q65boa8O+CA0oL5kRI5t4RqkC46jy1pHxAXUl2zEeP6mW2txj7T29oa+7mf7
         SvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=58oTnMT/MtJjFomhQl6lhOwVpv84uZYmbhCZv0q9vVw=;
        b=jIBxYRs1VkibOGKQPH+rCl0gla0tiEN/YdBIG1pBmo6BcdeB648W79RkrzeyZs4ut4
         APKEG1n51xIigQOmK2saWfUrCjKkGjJE+cryjEcuCY076siX9N2rteGuhdtS5RAcG3+T
         SoU4224j3KS6HuoIbVXFoDSMIdvERMW0h56k8tYR2FfzA+wFrofQ2e4d2y0VYeLhI2g1
         biOIpiWHtnHea1tLTQ8qqRTMxs3/GGmrSSNAfxhc+PKwyAlxY13octxU8e08oW2x459D
         ZfAn9Td1WlshTh8PIqOx3zSNURlecUq/i3rdRY70uSIzMl7bTrhSIGosga5NUHI68Bwd
         cHGQ==
X-Gm-Message-State: AOAM533Fc5BdY60k57Ms2rYaU1D8NGrNlwawSoOCkN3+VMkjupZAOqBe
        Pb6JVOPRaXae5nk/6U12v6q2O05K
X-Google-Smtp-Source: ABdhPJyEgs+qHIOVGmrVjSzZBWoR4vuJX+iQz/m5fo7SoY3jru+2apc5T4l/0A4iERdRa93LrC9QUw==
X-Received: by 2002:adf:9283:: with SMTP id 3mr31750922wrn.231.1593718569309;
        Thu, 02 Jul 2020 12:36:09 -0700 (PDT)
Received: from [192.168.0.38] (59.94.91.79.rev.sfr.net. [79.91.94.59])
        by smtp.gmail.com with ESMTPSA id c20sm14812698wrb.65.2020.07.02.12.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 12:36:08 -0700 (PDT)
Subject: Re: gadget mass storage with two USB OTG device controller
To:     Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <8f870ba5-5dec-e362-51dd-65311315f6f2@gmail.com>
 <CAH8TKc9gaebqZOpv0OFxG-Dq+Tj+FdgJamQ=eP4SMJ-eYBrkOA@mail.gmail.com>
From:   Benoit <benoit.sansoni@gmail.com>
Message-ID: <391a537e-108d-210b-01be-c20dd9d0e68e@gmail.com>
Date:   Thu, 2 Jul 2020 21:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAH8TKc9gaebqZOpv0OFxG-Dq+Tj+FdgJamQ=eP4SMJ-eYBrkOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

I am in fact a newbie in USB OTG device mode.
The configfs is really convenient.
It works like a charm.

I applied this configuration below and can see on the host the different 
mass storage.
This configuration can be set in boot init script file.
But what is the best choice to apply this configuration at boot up ? (I 
am currently using yocto.)


Thank you so much for your help
Benoit

   root@samx8xqxp-hds:~# cd /sys/kernel/config/
   root@samx8xqxp-hds:/sys/kernel/config# ls
   usb_gadget
   root@samx8xqxp-hds:/sys/kernel/config# cd usb_gadget/
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget# mkdir g1
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget# ls g1
   UDC              bDeviceProtocol  bMaxPacketSize0 bcdUSB           
functions        idVendor         strings
   bDeviceClass     bDeviceSubClass  bcdDevice configs          
idProduct        os_desc
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget# cd g1
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# mkdir configs/c.1
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# mkdir 
functions/mass_storage.0
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# dd if=/dev/zero 
of=/tmp/big1 bs=1024 count=200000
   200000+0 records in
   200000+0 records out
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# dd if=/dev/zero 
of=/tmp/big2 bs=1024 count=200000
   200000+0 records in
   200000+0 records out
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1#
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# ls
   UDC              bDeviceProtocol  bMaxPacketSize0 bcdUSB           
functions        idVendor         strings
   bDeviceClass     bDeviceSubClass  bcdDevice configs          
idProduct        os_desc
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo /tmp/big1 > 
functions/mass_storage.0/lun.0/file
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# mkdir strings/0x409
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# mkdir 
configs/c.1/strings/0x409
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo 0xa4a2 > 
idProduct
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo 0x0525 > 
idVendor
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo 000000001 > 
strings/0x409/serialnumber
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo COMPANY > 
strings/0x409/manufacturer
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo "Mass 
Storage Gadget 1" > strings/0x409/product
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo "Conf 1" > 
configs/c.1/strings/0x409/configuration
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# ln -s 
functions/mass_storage.0 configs/c.1
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# echo 
"5b110000.usb3" > UDC
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g1# cd ..
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget# ls
   g1
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget# cd ..
   root@samx8xqxp-hds:/sys/kernel/config# mkdir usb_gadget/g2
   root@samx8xqxp-hds:/sys/kernel/config# cd usb_gadget/g2/
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# mkdir configs/c.2
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# mkdir 
functions/mass_storage.0
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo /tmp/big2 > 
functions/mass_storage.0/lun.0/file
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# mkdir strings/0x409
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# mkdir 
configs/c.2/strings/0x409
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo 0xa4a2 > 
idProduct
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo 0x0525 > 
idVendor
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo 000000002 > 
strings/0x409/serialnumber
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo COMPANY > 
strings/0x409/manufacturer
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo "Mass 
Storage Gadget 2" > strings/0x409/product
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo "Conf 2" > 
configs/c.2/strings/0x409/configuration
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# ln -s 
functions/mass_storage.0 configs/c.2
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# ls /sys/class/udc/
   5b110000.usb3  ci_hdrc.0
   root@samx8xqxp-hds:/sys/kernel/config/usb_gadget/g2# echo "ci_hdrc.0" 
 > UDC

On 02/07/2020 20:12, Felipe Balbi wrote:
> Hi,
>
> On Thu, Jul 2, 2020 at 4:08 PM Benoit <benoit.sansoni@gmail.com> wrote:
>> Hello Felipe,
>>
>> I contact you because I used the perl script to check out which is the
>> maintainer of the gadget drivers.
>>
>> I am working on a project using NXP imx8 processor which has two USB OTG
>> controller.
>> Both support device mode.
>> I am using kernel release 4.19.35.
>>
>> I tried to use the g_mass_storage driver using different "file="
>> paramter to each of them without success.
>>
>> I dig into the Documentation folder, but did not find the way to do that.
>>
>>
>> Question:
>>
>> Is it possible to run at the same time the g_mass_storage driver on two
>> different USB OTG device controller?
> yes, look at the configfs interface for the gadget framework
>

