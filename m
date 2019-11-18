Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E315100881
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 16:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKRPoO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 10:44:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29672 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726646AbfKRPoO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 10:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574091851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QZBkCi3gK/QMtOt3j8uyuHS7RnD7Kp/Z8qSH1u/S39Y=;
        b=VdxY+dgyFRv8ATZOOiYCekODLgwf/4Mozz+7DibCf4dcMyhxHywRkFj7phWWm9n7EGY8Go
        qKdzJWkWVNdO/8DuiFJuj8U6CSWsr4i47vZ12WYGHU6Pk89S6Y6u1mc1WFa3BNK2QIte+8
        wZMe37ZfpVteeHZgQ6Z8049EQisBSM4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-NqZBaH-oOhSE-EjhOtaBkQ-1; Mon, 18 Nov 2019 10:44:05 -0500
Received: by mail-qt1-f200.google.com with SMTP id c32so12525982qtb.14
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 07:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y44LKnAjvcGo//Jkjhq/bP593o47nm5DE81RljG1l3A=;
        b=SimcWIkNKm3AwyfbKIezA2RSO3AE7vM6z0V/DI8Poj5FDtvLYN977YUKZEM4fxTyPe
         IsYy65HzZh0ULJPCzCAOy6BcuB06SHIFp2rl/EHX18WPOgjcxD9nJ0JRxAXy+5Ye8Kin
         TldTdQIj+6PZsdONn+TqEwP5dmctYzCn8sC9HPERwC7hkBtdkZn8cbR+e+ENW6HU0ZPo
         mqg8cInU+TjdtrEZ7lEE7OT7yURbZUG0JwzOpcYrqPc/kPxrlfrK4q/ecKYkMCRSia8Y
         sbZhzaSTWgJlm3MmZuGohrW5xGSjtKXFQU6fz3KQ1ORH15ofdq91kVtafovQict8nMr2
         zZFQ==
X-Gm-Message-State: APjAAAXaoQW/uVvfBGsrNvHBwGGPwyowXq+5H+CXB73P1gaWO+iw6wRG
        JCAP+Jgs+zXP7XHJX8tWhk9dv7yCfiI1PkMk9sg7NMQjvEV4hNyonOKqRa51wKJpcE8S+cexO1X
        DfrdVATjTco7opgOfucz1
X-Received: by 2002:a37:9cc2:: with SMTP id f185mr14962122qke.2.1574091845060;
        Mon, 18 Nov 2019 07:44:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyyYrcQ7wjr+sK9s7KfenGRIKCdlXLEY4BkQLYNWkzgHKa8cYS72KYkNo5CaSO8U+RWqkoBXA==
X-Received: by 2002:a37:9cc2:: with SMTP id f185mr14962093qke.2.1574091844702;
        Mon, 18 Nov 2019 07:44:04 -0800 (PST)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id 2sm4854675qks.97.2019.11.18.07.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2019 07:44:03 -0800 (PST)
Subject: Re: JMicron USB to ATA/ATAPI Bridge requires usb-storage quirks to
 disable uas
To:     Greg KH <gregkh@linuxfoundation.org>,
        Pacho Ramos <pachoramos@gmail.com>,
        Laura Abbott <labbott@fedoraproject.org>
Cc:     linux-usb@vger.kernel.org
References: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
 <20191118112837.GE156486@kroah.com>
From:   Laura Abbott <labbott@redhat.com>
Message-ID: <ead122bf-4fb5-a9a8-053d-37426a4b7605@redhat.com>
Date:   Mon, 18 Nov 2019 10:44:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118112837.GE156486@kroah.com>
Content-Language: en-US
X-MC-Unique: NqZBaH-oOhSE-EjhOtaBkQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/18/19 6:28 AM, Greg KH wrote:
> On Mon, Nov 18, 2019 at 11:07:55AM +0100, Pacho Ramos wrote:
>> Hello,
>>
>> I would like to forward the patch that is being used for years in
>> Fedora and Gentoo to fix connectivity issues of JMicron devices with
>> UAS when they got into idle state:
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1260207
>> https://bugs.gentoo.org/640082
>>
>> The problem is still valid with current kernels, then, I guess the
>> patch wasn't forwarded here or got forgotten for some reason. This
>> patch works fine for current kernel 4.13.11 too
>=20
> Laura, any reason this patch was never sent upstream to us?  Any
> objection for the patch below to be merged?
>=20

Huh this must have completely slipped off my radar. No objections.
Thanks for the follow up!

> thanks,
>=20
> greg k-h
>=20
>>  From d02a55182307c01136b599fd048b4679f259a84e Mon Sep 17 00:00:00 2001
>> From: Laura Abbott <labbott@fedoraproject.org>
>> Date: Tue, 8 Sep 2015 09:53:38 -0700
>> Subject: [PATCH] usb-storage: Disable UAS on JMicron SATA enclosure
>>
>> Steve Ellis reported incorrect block sizes and alignement
>> offsets with a SATA enclosure. Adding a quirk to disable
>> UAS fixes the problems.
>>
>> Reported-by: Steven Ellis <sellis@redhat.com>
>> Signed-off-by: Laura Abbott <labbott@fedoraproject.org>
>> ---
>>   drivers/usb/storage/unusual_uas.h | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unu=
sual_uas.h
>> index c85ea53..216d93d 100644
>> --- a/drivers/usb/storage/unusual_uas.h
>> +++ b/drivers/usb/storage/unusual_uas.h
>> @@ -141,12 +141,15 @@ UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
>>   =09=09USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   =09=09US_FL_NO_ATA_1X),
>>  =20
>> -/* Reported-by: Takeo Nakayama <javhera@gmx.com> */
>> +/*
>> + * Initially Reported-by: Takeo Nakayama <javhera@gmx.com>
>> + * UAS Ignore Reported by Steven Ellis <sellis@redhat.com>
>> + */
>>   UNUSUAL_DEV(0x357d, 0x7788, 0x0000, 0x9999,
>>   =09=09"JMicron",
>>   =09=09"JMS566",
>>   =09=09USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> -=09=09US_FL_NO_REPORT_OPCODES),
>> +=09=09US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>>  =20
>>   /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
>>   UNUSUAL_DEV(0x4971, 0x1012, 0x0000, 0x9999,
>> --=20
>> 2.4.3
>>
>=20

