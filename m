Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17BF587C6B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 14:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbiHBM1p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 08:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiHBM1o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 08:27:44 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FED5071A
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 05:27:43 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id kb8so11070802ejc.4
        for <linux-usb@vger.kernel.org>; Tue, 02 Aug 2022 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9yYkGp6E9QKEaYucsZdmHNy21sOkuSdQhxrr89SzmeI=;
        b=Det5oftkIwzy9AE9USffPNIxlBxjIbRrBOpvR6K7qIaCBBkxU1SETvEITt09YSfYlp
         XWHqcYU5FOJU2A7Rt59hcaXcx2MvvbVrWZ3iLvPD81mmVo5L/AZVJ5uv+XfhFQRjcrRb
         XCYZsKA3kAtyKgtbXc5r0ubm4vyC/8udYX9Sjs1jxvMJW+SRjpyw5VnIe1O0pYoVzm/W
         ioWZ8f+uESsJTUfk1oDo9/ZYswR6wUstVjx5oNNdzn04xRN3ie2wj+j13YdGVHloA8uG
         r8+cUmTKYF6Or5vpj40ekfSa/lIAmimDPokKmwwbdVFvUtkyVHBrfQJTBMP4VwOe7fxj
         S72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9yYkGp6E9QKEaYucsZdmHNy21sOkuSdQhxrr89SzmeI=;
        b=uYe1w3FbdxttwOqhYdj/KowbDuQpM5qlkeQ1yFMVRu1EF3f6XzlUNnB7vUCxMqk3dE
         k0kuy8Ia1BOf+6n5DvPPndnymPIRCU6A2NBOyBatFEKPatwB7VSdyHxi3SE4bsjF0zpP
         itMJx7pI32rSGs2aCQmaMLE6dKmp+GBUeC8IiKfK5ZuY9JkQ8vMRNDaI3dODt4YbS5fR
         FSlMZipcvUslAJDrVfF5lR0jRiQTHKby8UgLeyoJ+SaK4DSD45PffINy1Sdh8rNCkODU
         6JN9QednEnG4DSu/gO8Fti3Xs+Orpk6TcjOA5TUD+gUpQ6BepupYb6RLc3je2n2hn7Gp
         xW4w==
X-Gm-Message-State: AJIora+guR7k43uBN+KzVhkYG2B3U1Q01CL9xos+LDWKqXBj/STNuy//
        pLdZzb32H3i4J8iKQPgsGQO/uJN5zQfRiz2yZKPq
X-Google-Smtp-Source: AGRyM1uaVGYBctHnloi8+hxyk8YSIAMW5xBrn+gQ/hov9jQD+YE4DMJENyynVJKWr2ZuHY6QVGJElY68ozfpVJp41V0=
X-Received: by 2002:a17:907:86ac:b0:72b:87f6:75c2 with SMTP id
 qa44-20020a17090786ac00b0072b87f675c2mr16462776ejc.667.1659443261733; Tue, 02
 Aug 2022 05:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220729094022.186496-1-lb@semihalf.com> <Yuep3lpI02gWiJY9@lahna>
In-Reply-To: <Yuep3lpI02gWiJY9@lahna>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Tue, 2 Aug 2022 14:27:30 +0200
Message-ID: <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> Hi,
>
> On Fri, Jul 29, 2022 at 11:40:22AM +0200, =C5=81ukasz Bartosik wrote:
> > A thunderbolt
> > lspci -d 8086:9a1b -vmmknn
> > Slot: 00:0d.2
> > Class:        System peripheral [0880]
> > Vendor:       Intel Corporation [8086]
> > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> >
> > presents itself with PCI class 0x088000 after Chromebook boots.
> > lspci -s 00:0d.2 -xxx
> > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt =
4
> > NHI #0 (rev 01)
> > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > ...
> >
> > However after thunderbolt is powered up in nhi_probe()
> > its class changes to 0x0c0340
> > lspci -s 00:0d.2 -xxx
> > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt =
4
> > NHI #0 (rev 01)
> > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > ...
> >
> > which leaves pci_dev structure with old class value
> > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > 0x088000
>
> This is completely unexpected. Which Chromebook this is and have you
> tried to upgrade it to the latest?
>

This happens on a Tiger Lake based reference Chromebook platform.
The issue also happens on the latest ChromeOS image available for that plat=
form.

> > This fix updates PCI device class in pci_dev structure after
> > thunderbolt is powered up.
>
> I think we need to understand why this happens in the first place before
> doing anything else.

If you have suggestions what else to check apart from what I already
did then please
let me know I will gladly do it.

Thanks,
Lukasz
