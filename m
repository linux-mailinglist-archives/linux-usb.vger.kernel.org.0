Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370294EA908
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 10:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbiC2IQ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 04:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbiC2IQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 04:16:25 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F857EA16
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1648541681; x=1680077681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ynEFQsC8hbL57VrTSrxKWhCNhcRSSU9o87WmR6LjsI=;
  b=fMQhqJdrRkzTq/Y1JyOrlzy9FdFbb22xsDySZ1oelUy5hRl2WX5rap1v
   sHeKJLg3tnLVD4kaVGVdm+K7+GBpuuCsiaiHEgNH7sOnIOm1oxBnvdOOv
   rvmUyPCl9FWILmVIJrJzUKLQiSjeiLRU8jjK1NbjyZ8EmeM+mI2pVHemh
   02M6D6ftIAyysm5KzgqA4EK/2RvED8oBg8nbrD9x3y08yW9Cr5Ynzh7Em
   m7Nc6+VoRkMh1s07nFe4heJ22RbvTHsuflMdBNXvYYEBBb/A+jDhtCUt5
   DZfptE47feSZPKY6GtLgQM0DcextbN8IRc7nslPfNtldkRTfY1umbYyn6
   g==;
X-IronPort-AV: E=Sophos;i="5.90,219,1643670000"; 
   d="scan'208";a="22952252"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 29 Mar 2022 10:14:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 29 Mar 2022 10:14:39 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 29 Mar 2022 10:14:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1648541679; x=1680077679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ynEFQsC8hbL57VrTSrxKWhCNhcRSSU9o87WmR6LjsI=;
  b=DyNOriQ8xNoiPX04hq2gOmXCeQ9ilxAfIVpqdhvhD9s7Rg0BYtoYc/ju
   aGQEdz01NBbgLK6WPC8WDJv7lGG4aTLa384GhP5wFqnJ4ixWuLA1ZsN5S
   Fgu4MsxZ21Z0rauJDruCAiohTWt0HsoeL/9vJoo4cHHtldyVZNusbNqcs
   xbzh1BB9AmwC2qrjNEojbcvCFAwbO/dBD6OltPzrCE8KarkndzDq3Dumh
   shy8JDKZzg/ktWrf8w4WWmJH+F9EgpX487hXmk40O73dtgpR/CVifrh8q
   9uU+16tzaXF/e0RVqzwGhsszRSNxj0OvHchlgW0erNMMVBRyMWi+TQ8MS
   g==;
X-IronPort-AV: E=Sophos;i="5.90,219,1643670000"; 
   d="scan'208";a="22952251"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Mar 2022 10:14:39 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E94F9280065;
        Tue, 29 Mar 2022 10:14:38 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime pm for HSIC interface
Date:   Tue, 29 Mar 2022 10:14:36 +0200
Message-ID: <1891703.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAL411-o8TPNv8vAfdPtzTaFkOGc7EmwNJv1Jxc-YUv1wc_vq0g@mail.gmail.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com> <CAL411-o8TPNv8vAfdPtzTaFkOGc7EmwNJv1Jxc-YUv1wc_vq0g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Peter,

Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > With the add of power-domain support in commit 02f8eb40ef7b ("ARM: dts:
> > imx7s: Add power domain for imx7d HSIC") runtime suspend will disable
> > the power-domain. This prevents IRQs to occur when a new device is
> > attached
> > on a downstream hub.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to mounted USB =
HUB
> > on usbh device. Cold plugging an USB mass storage device is working fin=
e.
> > But once the last non-HUB device is disconnected the ci_hdrc device goes
> > into runtime suspend.
>=20
> Would you please show the difference between cold boot and runtime
> suspend after disconnecting
> the last USB device?
>=20
> - Power domain on/off status for HUB device
> - Runtime suspend status at /sys entry for HUB device
> - "/sys/..power/wakeup" /sys entry  for HUB device

I hope I got all entries you requested.

=46or reference this is the bus topology:
lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3Dusb-storage=
, 480M

Bus 2 is a different connector and doesn't matter here. I'm disconnecting '=
Dev=20
3' in this scenario.

After boot up with the bus as shown above:
$ cat /sys/bus/usb/devices/1-1/power/wakeup
disabled
$ cat /sys/bus/usb/devices/1-1/power/runtime_status
active
$ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
on

After disconnecting Dev 3 from the bus ('usb 1-1.2: USB disconnect, device=
=20
number 3' in dmesg) the status changes as follows (without the patch):
$ cat /sys/bus/usb/devices/1-1/power/wakeup
disabled
$ cat /sys/bus/usb/devices/1-1/power/runtime_status
suspended
$ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
off-0

=46or the record, when applying the posted patch this changes into:
$ cat /sys/bus/usb/devices/1-1/power/wakeup
disabled
$ cat /sys/bus/usb/devices/1-1/power/runtime_status
suspended
$ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
on

Regards,
Alexander



