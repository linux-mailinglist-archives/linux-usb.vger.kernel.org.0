Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2959C51C3D4
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 17:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381280AbiEEP0r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 11:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381270AbiEEP0n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 11:26:43 -0400
Received: from louie.mork.no (louie.mork.no [IPv6:2001:41c8:51:8a:feff:ff:fe00:e5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA850562CA
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 08:23:03 -0700 (PDT)
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9d:7e00:0:0:0:1])
        (authenticated bits=0)
        by louie.mork.no (8.15.2/8.15.2) with ESMTPSA id 245FMp1u091510
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Thu, 5 May 2022 16:22:52 +0100
Received: from miraculix.mork.no ([IPv6:2a01:799:c9d:7e02:9be5:c549:1a72:4709])
        (authenticated bits=0)
        by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 245FMjj5762752
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Thu, 5 May 2022 17:22:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1651764166; bh=63C87RZb7Ur060W9Klcu3dMlMcFoGX3woga+AFazxm8=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=Iuonc04X4iWT1kPk5zj4iA+cF61uMIxKx8HEPorIHl+KeVilkqxPv7ll+stmOR74D
         9+ups83jYRKZRh2HvPNxOL6byzQb5bycVN2uXRXaX1NSgx/yv/LhuPz5tHXdXmM9qT
         5TTVc1jTvXRM1yDZyWOnhdN2eAM7Adfgq653e9CI=
Received: (nullmailer pid 62898 invoked by uid 1000);
        Thu, 05 May 2022 15:22:45 -0000
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
Organization: m
References: <20220504083612.143463-1-jtornosm@redhat.com>
        <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
        <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
        <87levgkyjy.fsf@miraculix.mork.no>
        <YnPb04ynkSTlhg4H@rowland.harvard.edu>
Date:   Thu, 05 May 2022 17:22:45 +0200
In-Reply-To: <YnPb04ynkSTlhg4H@rowland.harvard.edu> (Alan Stern's message of
        "Thu, 5 May 2022 10:14:43 -0400")
Message-ID: <875ymkknqy.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.5 at canardo
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> writes:

> Please pardon me for butting in, but I don't see how this tests the=20
> condition that Jose is worried about.
..
> And presumably the device is working again.  However, none of this shows=
=20
> what happens when the device is unconfigured.  To test that, you would=20
> have to do:
>
> 	echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
> 	echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue
>
> and then see if the device continues to work.

Ah, sorry. Scanned briefly, saw "bind", and assumed too much.  Making an
ass out of... you know.

Actually I didn't understand the part about unconfiguration since I
can't see how that would happen during normal usage?  Anyway,
unconfiguring also works for me:

canardo:/tmp# hciconfig hci0
hci0:   Type: Primary  Bus: USB
        BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
        UP RUNNING=20
        RX bytes:660 acl:0 sco:0 events:43 errors:0
        TX bytes:2178 acl:0 sco:0 commands:43 errors:0

canardo:/tmp# echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
canardo:/tmp# hciconfig hci0
Can't get device info: No such device
canardo:/tmp# echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue


Not entirely sure how to validate that "everything" works at this point?
I can use the rfcomm session the adapter usually handles and also run
lescan after this.  So I guess both BLE and BDR works.

And the counters count something:

canardo:/tmp# hciconfig hci0
hci0:   Type: Primary  Bus: USB
        BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
        UP RUNNING=20
        RX bytes:3883 acl:40 sco:0 events:81 errors:0
        TX bytes:2518 acl:19 sco:0 commands:50 errors:0


I can see an error like this logged every time I unconfigure the device:

Bluetooth: hci0: urb 00000000e66a2492 failed to resubmit (2)

There is nothing else logged in kernel log


Bj=C3=B8rn
