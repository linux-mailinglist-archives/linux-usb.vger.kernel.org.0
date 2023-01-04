Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDD5E65DAC1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 17:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbjADQwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 11:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240268AbjADQwE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 11:52:04 -0500
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6352943A05
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 08:47:42 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id 6DBB012D072;
        Wed,  4 Jan 2023 17:47:32 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1672850852; bh=4T+8BpTcxtN2v78620OXeL3TILnwGf0JEvHMB746yz0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V04K/ulsVzGomWPqnMS2W7w3iwE04l/tdErT/P+lOhd1NEiPuJcSv9nwGh2Q1wg42
         ESn2rf3MgTzLSpyXrfJxNoiSSBQ4ke7B3gzg4VvVIRgEPsX4xb+STeEb+H2h1+5eRF
         8KGaElmGJRO7HXDa4qwt7T2wYCrrft49e0B5PD5MVkOzqIiS7PYMaoC5M1mJ9aHV7r
         FLBaN5c7FlswlZ+++pg4ogd3ytRYtlLbxrbSuQyJEr3S5N+nvu0ieFsO/vo1iMlLbG
         iB8jkPbB8WVHN9dTNdV2G+ASE6kJvDm3suuEbePUFiQ3Bg0Id5/sStTfwt1Goinosf
         M0yuDuYmao4ag==
Date:   Wed, 4 Jan 2023 17:47:31 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <20230104174731.5527b1ed@meshulam.tesarici.cz>
In-Reply-To: <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
        <20230104164900.31a3243d@meshulam.tesarici.cz>
        <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

I clicked the Send button too early...

V Wed, 4 Jan 2023 11:18:29 -0500
Alan Stern <stern@rowland.harvard.edu> naps=C3=A1no:

> On Wed, Jan 04, 2023 at 04:49:00PM +0100, Petr Tesa=C5=99=C3=ADk wrote:
> > On Wed, 4 Jan 2023 15:13:41 +0100
> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
> >  =20
> > > Hi folks,
> > >=20
> > > I'm struggling with autosuspend on my Samsung phone in download mode,=
 =20
>=20
> Wait...  Autosuspend is carried out by the host, but you appear to be=20
> stating that the Samsung phone is acting as a USB device (i.e., it's=20
> being autosuspended, not that it is autosuspending something else). =20
> Is that right?
>=20
> > > as it apparently breaks heimdall/libusb on my Tumbleweed system. Here=
's
> > > what I'm seeing:
> > >=20
> > > - My device is autosuspended, because it has been idle for long enoug=
h.
> > > - cd /sys/bus/usb/devices/1-4/  # my device's port
> > > - echo -1 > power/autosuspend
> > > - The device is reset and gets a new device ID.
> > >   The current directory is no longer valid (becomes empty). =20
> >=20
> > On a second thought, this looks like the actual bug. I don't think
> > we're supposed to see a disconnect+reconnect whenever a suspended USB
> > device is resumed. Then again, I'm no expert on USB... =20
>=20
> In general there should not be a disconnect during a resume.  But it can=
=20
> happen, depending on how the device behaves.


>  Perhaps your phone is=20
> disconnecting deliberately.
>=20
> The dmesg log ought to contain some useful information, particularly if=20
> you enable USB kernel debugging before starting the experiment:
>=20
> 	echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control

I can see there is an -EIO after the resume attempt:

Jan 04 17:44:38 meshulam kernel: usb 1-4: usb auto-resume
Jan 04 17:44:38 meshulam kernel: hub 1-0:1.0: state 7 ports 4 chg 0000 evt =
0010
Jan 04 17:44:38 meshulam kernel: usb 1-4: Waited 0ms for CONNECT
Jan 04 17:44:38 meshulam kernel: usb 1-4: finish resume
Jan 04 17:44:38 meshulam kernel: usb 1-4: retry with reset-resume
Jan 04 17:44:38 meshulam kernel: usb 1-4: reset high-speed USB device numbe=
r 46 using xhci_hcd
Jan 04 17:44:38 meshulam kernel: usb 1-4: gone after usb resume? status -5
Jan 04 17:44:38 meshulam kernel: usb 1-4: can't resume, status -5
Jan 04 17:44:38 meshulam kernel: usb usb1-port4: logical disconnect
Jan 04 17:44:38 meshulam kernel: usb usb1-port4: status 0503, change 0000, =
480 Mb/s
Jan 04 17:44:38 meshulam kernel: usb 1-4: USB disconnect, device number 46
Jan 04 17:44:38 meshulam kernel: usb 1-4: unregistering device
Jan 04 17:44:38 meshulam kernel: usb 1-4: unregistering interface 1-4:1.0
Jan 04 17:44:38 meshulam kernel: usb 1-4: unregistering interface 1-4:1.1
Jan 04 17:44:38 meshulam kernel: usb 1-4: usb_disable_device nuking all URBs
Jan 04 17:44:38 meshulam kernel: usb 1-4: new high-speed USB device number =
47 using xhci_hcd
Jan 04 17:44:38 meshulam kernel: usb 1-4: skipped 4 descriptors after inter=
face
Jan 04 17:44:38 meshulam kernel: usb 1-4: default language 0x0409
Jan 04 17:44:38 meshulam kernel: usb 1-4: udev 47, busnum 1, minor =3D 46
Jan 04 17:44:38 meshulam kernel: usb 1-4: New USB device found, idVendor=3D=
04e8, idProduct=3D685d, bcdDevice=3D 2.1b
Jan 04 17:44:38 meshulam kernel: usb 1-4: New USB device strings: Mfr=3D1, =
Product=3D2, SerialNumber=3D0
Jan 04 17:44:38 meshulam kernel: usb 1-4: Product: SAMSUNG USB DRIVER
Jan 04 17:44:38 meshulam kernel: usb 1-4: Manufacturer: SAMSUNG
Jan 04 17:44:38 meshulam kernel: usb 1-4: usb_probe_device
Jan 04 17:44:38 meshulam kernel: usb 1-4: configuration #1 chosen from 1 ch=
oice
Jan 04 17:44:38 meshulam kernel: usb 1-4: adding 1-4:1.0 (config #1, interf=
ace 0)
Jan 04 17:44:38 meshulam kernel: cdc_acm 1-4:1.0: usb_probe_interface
Jan 04 17:44:38 meshulam kernel: cdc_acm 1-4:1.0: usb_probe_interface - got=
 id
Jan 04 17:44:38 meshulam kernel: usb 1-4: adding 1-4:1.1 (config #1, interf=
ace 1)
Jan 04 17:44:38 meshulam kernel: cdc_acm 1-4:1.1: usb_probe_interface
Jan 04 17:44:38 meshulam kernel: cdc_acm 1-4:1.1: usb_probe_interface - got=
 id
Jan 04 17:44:38 meshulam kernel: hub 1-0:1.0: state 7 ports 4 chg 0000 evt =
0000

Petr T
