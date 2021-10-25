Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E80439957
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 16:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbhJYO5I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 10:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39725 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233002AbhJYO5H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 10:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635173684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kJqDtzZEgW4Alx+2ZV3iN5kWSvk33ohaen5h1QfXtuQ=;
        b=GOGT41ndgwTbgHxcOvQhjJab+q2pKWoWx4E1VIuY7/CglOEKrUXKcAETwZew7zwSjGrZRu
        XxSF1RtwgEP7eimv48VRe1Q/X8PoBxNDY5SY0NzemSbWUGsB0FopRYJQklpLDCHYcmhRMs
        aWEdI/L4UWO7cxvWkLeQvEpUi2YhIKg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-zgF-vZ_rOpCyDJfBvKfaTw-1; Mon, 25 Oct 2021 10:54:43 -0400
X-MC-Unique: zgF-vZ_rOpCyDJfBvKfaTw-1
Received: by mail-ed1-f70.google.com with SMTP id x13-20020a05640226cd00b003dd4720703bso4207798edd.8
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 07:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kJqDtzZEgW4Alx+2ZV3iN5kWSvk33ohaen5h1QfXtuQ=;
        b=6cGjPS83LG0z9H9rbnas3lLU87YvPxPZyc0ySA4eJfT6/wJkiiiL1RODbR+38UtuIy
         EP1IkT3f3358m+8RfGz94+qojyfAZK4uJtC7hF4ZD2NxGnfoLi7Y6vUgXfbeqRohvYvr
         FwokRJJzLfAndUZSQ/G+2P9RsSLcvscUpNVIADIlzOYChl79/qd0KhaFgj0FoBc9QSpX
         csW9y1Gx8QVZMFezy/muXEf2Gnzmc+PtBF0UteMKT+s8ziBVD6W2BtLkwGp4h48DhiNu
         ue14cJTKLxy6oRUOZ/ZSRWcHCOlsDAFZSft/73WkYqb44XHr4du2y1H5WvAEhy6LoOU5
         74Lw==
X-Gm-Message-State: AOAM5339BgPdx1WehMChoDriSPOpzqs5saAEeskdzvd23xUroZF+bPBt
        lgRzVDvEe7L3aRwzEPZ6ZUFIhsmkHgTYPnqmWsuQcwAtdpcznZY1JqcNoJuUzf+AK8YsOnBwJXt
        XS1Bi4OsLJQqd+AvSa21S
X-Received: by 2002:aa7:cb96:: with SMTP id r22mr26816670edt.87.1635173682322;
        Mon, 25 Oct 2021 07:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw94AvBGd9mDvdmpcHdkbu2h5LwzcjM+CmYICX0+EFffjvs11nwUfkFo9SJc0Znh92tFaOHGA==
X-Received: by 2002:aa7:cb96:: with SMTP id r22mr26816644edt.87.1635173682107;
        Mon, 25 Oct 2021 07:54:42 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id x22sm9109620edv.14.2021.10.25.07.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:54:41 -0700 (PDT)
Message-ID: <b067d9f8-4d15-ac5e-3f1f-ff2ffa3b29aa@redhat.com>
Date:   Mon, 25 Oct 2021 16:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Disabling intel-wmi-thunderbolt on devices without Thunderbolt /
 detecting if a device has Thunderbolt
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@outlook.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
 <PH0PR15MB4992B80415BE9BD4836CF336E1839@PH0PR15MB4992.namprd15.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <PH0PR15MB4992B80415BE9BD4836CF336E1839@PH0PR15MB4992.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/25/21 16:36, Mario Limonciello wrote:
> Surface Laptop go is this right?
> New Lightweight Surface Laptop Go =E2=80=93 The Everyday, Everywhere La=
ptop =E2=80=93 Microsoft Surface <https://www.microsoft.com/en-us/d/surfa=
ce-laptop-go/94fc0bdgq7wv?activetab=3Dpivot:techspecstab>
> IOW: "10th Gen Intel=C2=AE Core=E2=84=A2 i5 processor =E2=80=93 1035G1"=
=2E
>=20
> That should be Ice Lake according to ARK:
> Intel Core i51035G1 Processor 6M Cache up to 3.60 GHz Product Specifica=
tions <https://ark.intel.com/content/www/us/en/ark/products/196603/intel-=
core-i51035g1-processor-6m-cache-up-to-3-60-ghz.html>
>=20
> ICL should have integrated TBT3.=C2=A0 The concept of the force power W=
MI attribute makes "most" sense when it comes to a GPIO getting toggled.

I'm not talking about the Surface Laptop Go, but about the "Surface Go"
which uses the classic Surface tablet with kickstand form-factor with
the following CPU: Intel(R) Pentium(R) CPU 4415Y

The model definitely does not have Thunderbolt.

>>This causes a /sys/bus/wmi/devices/.../force_power attribute to be crea=
ted
> and echoing to that executes ACPI code which ends up poking at things i=
t
> should not be poking at on the Surface Go.
>=20
> Yes that's exactly what is supposed to happen that this attribute is ma=
de.
> What exactly happens when you write into it?

The _SB.CGWR ACPI method gets called, with arguments coming from ACPI
settings stored in memory. Depending on those settings this function
either directly pokes some MMIO or tries to talk to an I2C GPIO
expander which is not present on the Surface Go, causing it to
MMIO poke an I2C controller which it should not touch.

In either case the AML code ends up poking stuff it should not touch
and the entire force_power sysfs attribute should simply not be
there on devices without thunderbolt.

Regards,

Hans



>=20
> -----------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------
> *From:* Hans de Goede <hdegoede@redhat.com>
> *Sent:* Monday, October 25, 2021 8:48
> *To:* Mika Westerberg <mika.westerberg@linux.intel.com>; Andreas Noever=
 <andreas.noever@gmail.com>; Michael Jamet <michael.jamet@intel.com>; Yeh=
ezkel Bernat <YehezkelShB@gmail.com>; Mario Limonciello <mario.limonciell=
o@outlook.com>
> *Cc:* linux-usb <linux-usb@vger.kernel.org>
> *Subject:* Disabling intel-wmi-thunderbolt on devices without Thunderbo=
lt / detecting if a device has Thunderbolt
> =C2=A0
> Hi All,
>=20
> While digging through Microsoft Surface Go ACPI tables to fix an unrela=
ted
> issue, I noticed that there is an intel-wmi-thunderbolt WMI device in t=
he
> ACPI tables and the intel-wmi-thunderbolt driver happily binds to this.=

> This is likely the result of copy paste programming of the ACPI tables.=

>=20
> This causes a /sys/bus/wmi/devices/.../force_power attribute to be crea=
ted
> and echoing to that executes ACPI code which ends up poking at things i=
t
> should not be poking at on the Surface Go.
>=20
> The problem of having these "nonsense" WMI devices with the
> intel-wmi-thunderbolt GUID is likely more wide-spread and ideally the
> intel-wmi-thunderbolt would ignore these.
>=20
> This makes me wonder if there is a way to see if there are any thunderb=
olt
> controllers on the system at all ? (with as goal to make intel-wmi-thun=
derbolt
> not bind if there are none)
>=20
> Regards,
>=20
> Hans
>=20
>=20

