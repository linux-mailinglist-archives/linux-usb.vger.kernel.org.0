Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398136CD074
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 05:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjC2DFP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 23:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjC2DFM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 23:05:12 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675DA1FCA
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 20:05:07 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8A514320090F
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 23:05:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 28 Mar 2023 23:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        invisiblethingslab.com; h=cc:content-type:content-type:date:date
        :from:from:in-reply-to:message-id:mime-version:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1680059104; x=1680145504; bh=/o
        2/9xrnfJysVp8kA9cnc6R2XdFxnEEL+xZZLUzc8HU=; b=gUFk8vWYnDV79yHf6Y
        D02PQZUUMQMpuv62TGN8tTyy10YwkzCgVSyHnYro8+OEapW7aka41PqF+eVTUl6i
        CXEXxebE9W8LyZ0+6WYqW9FBsKqzJ2LbA3nU42/LalmFuEZK3qyIvCgNGsZ7II4l
        nyIT1phhWa5AQsOa0XGEG/GF/xe1kpPRgYOvyV0zh/ybuhFIzzwd3Ed3rTGzaiWV
        35i4Xqgrm48FE5P8B89z5omtqENAVo3yOfQn7fhTjCg0Z5JyFOMf0uJKQaXQ7fNL
        fC09jtTerEbpPXYK+M1n1SjxFdtefZDgwSBAz+VK8K2viXSjV6oPqrwLKPnsE/tM
        AkSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680059104; x=1680145504; bh=/o2/9xrnfJysVp8kA9cnc6R2XdFxnEEL+xZ
        ZLUzc8HU=; b=q9m9yQ6iB3iB6CCrJHBxukkNf6gxee1RsM2Tz1JYgCFRo1GdWmM
        uwPiljGW5dXg0fOalGJkxVqfNQRAwB4+/riA8HfMh/Q+Kpwygn8ssPpeBox7Kc+p
        OUpBX1KRR3qKaqDhB7DC5xB/rD+ZtlhvrurY0SDpp8uReo1Z5uu6+fY24qgB1VL0
        rsj2BwAvwhIs5ZqDV80jRf4O8Jqd+caOHXLzXeBrAibzh3nAYXCzlO9wxqr4uNCd
        0sOZpZTHBpKs28e6tuByDs03ay2WPka8e8jV41vsdwFWt83WMhhHx17f+Rha+54n
        xtKCkIz2A4T/cKoGtxLRIAH1yAJHZZIGm0Q==
X-ME-Sender: <xms:36ojZMbpgUR71N6nZe_xxF6AXm-9AwMGqYO52ZAgkGwtOh0wR6-wRQ>
    <xme:36ojZHaJ1mGZ1_-hkFoHpu1MMnSTnPPbyN3OpK9wAa4zQ8uvZ7odHFdjLGzXrGof-
    DTf1IqYgLdDKw>
X-ME-Received: <xmr:36ojZG_jAGyMNKinvrSGvmHhiWY_k1Ah5irvWAWAiAgwFmT7agkZdwEGzePiJSdLc4T46maCpkNnAP_0GQVbQnnLGNsthYyB_h0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehhedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepgffffeetvddtjeekjefhudduudekffekjefhuefgffetfefg
    tdektdeiveeitefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:4KojZGr87fm0GTyj4pxTMHyA4Do7pbXt5i0MR24IL_EPfX-jOwSoKw>
    <xmx:4KojZHp5FxWJYUJqKtHhn-MCo96Dk0qURpQGwDBDPi6URBXMqRYluQ>
    <xmx:4KojZETxgFtNViWOd17E7fHOg6stJ0T_eHSKIDyAlhM0hXJNYlIAYQ>
    <xmx:4KojZE2H39RRpbF1Y6mIR9kg-H4tPDbHFKZVxJLnHz6xCuVUFNRNDQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 23:05:03 -0400 (EDT)
Date:   Wed, 29 Mar 2023 05:04:58 +0200
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     linux-usb@vger.kernel.org
Subject: earlyprintk=xdbc doesn't work on AMD Renoir
Message-ID: <ZCOq3PUBCtHkwdnw@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E5NehRBkKPFEKgZg"
Content-Disposition: inline
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--E5NehRBkKPFEKgZg
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="6FO3y47iLORSD1yX"
Content-Disposition: inline
Date: Wed, 29 Mar 2023 05:04:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-usb@vger.kernel.org
Subject: earlyprintk=xdbc doesn't work on AMD Renoir


--6FO3y47iLORSD1yX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to get early console working via USB3 debug capability[*]. It
works fine on Intel, but on AMD it does not. First issue is that the
BAR0 is 1MB and it's too big for early_ioremap(). Since all the
DbC-related registers are quite early (first page), this hack kinda
works:
---8<---
diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 341408410ed9..bfd41098fd83 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -83,6 +84,7 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u=
32 dev, u32 func)
 		write_pci_config_byte(bus, dev, func, PCI_COMMAND, byte);
 	}
=20
+	sz64 =3D min(sz64, 64ULL * 1024);
 	xdbc.xhci_start =3D val64;
 	xdbc.xhci_length =3D sz64;
 	base =3D early_ioremap(val64, sz64);
---8<---

Then, it fails with:

    waiting for connection timed out
    xhci_dbc:early_xdbc_setup_hardware: failed to setup the connection to h=
ost

On the other hand, enabling it later via sysfs works:

    [root@test-1 ~]# cat /sys/bus/pci/devices/0000\:04\:00.3/dbc=20
    disabled
    [root@test-1 ~]# echo enable > /sys/bus/pci/devices/0000\:04\:00.3/dbc
    [root@test-1 ~]# cat /sys/bus/pci/devices/0000\:04\:00.3/dbc=20
    configured
    [root@test-1 ~]# dmesg|tail
    [  365.992308] usb usb3-port2: config error
    [  370.042302] usb usb3-port2: Cannot enable. Maybe the USB cable is ba=
d?
    [  370.042333] usb usb3-port2: config error
    [  370.837429] usb usb3-port2: config error
    [  371.667309] usb usb3-port2: config error
    [  372.499309] usb usb3-port2: config error
    [  373.331309] usb usb3-port2: config error
    [  374.315309] usb usb3-port2: config error
    [  375.003453] xhci_hcd 0000:04:00.3: DbC connected
    [  375.459336] xhci_hcd 0000:04:00.3: DbC configured


The obvious difference is that later the full xhci driver is loaded and
the main controller is initialized. I've tried the simple thing: setting
Run/Stop bit to 1 with this hacky patch:
---8<---
diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 341408410ed9..03c6a815e3e2 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -420,6 +422,22 @@ static int xdbc_start(void)
 	u32 ctrl, status;
 	int ret;
=20
+	if (xdbc.vendor =3D=3D PCI_VENDOR_ID_AMD) {
+		u8 caplen =3D readb(xdbc.xhci_base);
+		u32 usbcmd =3D readl(xdbc.xhci_base + caplen);
+		xdbc_trace("USBCMD before: %#x\n", usbcmd);
+		xdbc_trace("USBSTS before: %#x\n", readl(xdbc.xhci_base + caplen + 4));
+		writel(usbcmd | 1, xdbc.xhci_base + caplen);
+		/* wait for HCH to clear */
+		ret =3D handshake(xdbc.xhci_base + caplen + 4, 1, 0, 100000, 100);
+		if (ret) {
+			xdbc_trace("failed to enable XHCI\n");
+			return ret;
+		}
+		xdbc_trace("USBCMD after: %#x\n", readl(xdbc.xhci_base + caplen));
+		xdbc_trace("USBSTS after: %#x\n", readl(xdbc.xhci_base + caplen + 4));
+	}
+
 	ctrl =3D readl(&xdbc.xdbc_reg->control);
 	writel(ctrl | CTRL_DBC_ENABLE | CTRL_PORT_ENABLE, &xdbc.xdbc_reg->control=
);
 	ret =3D handshake(&xdbc.xdbc_reg->control, CTRL_DBC_ENABLE, CTRL_DBC_ENAB=
LE, 100000, 100);
---8<---

but it did not helped.

I've checked DbC registers in those two situations:
When it works:
  control: 0x820f003, status: 0x06000000, portsc: 0x00001003
When it doesn't:
  control: 0x800f002, status: 0x00000000, portsc: 0x000000a0

Any ideas?

Specific hardware is: AMD Ryzen 5 4500U, HP Probook 445 G7/8730

Full dmesg attached. The related controller is 04:00.3.


PS I added `#define xdbc_trace printk`, as I couldn't figure out how to
use tracing API. How to do that properly?

[*] In fact, I'm trying to get it working in Xen, but I figured it will
be easier to debug it in Linux first and only then do the same in Xen.
Details:
https://lore.kernel.org/xen-devel/cover.932f486c1b08268190342f8918b09fa6a7c=
3f149.1670724490.git-series.marmarek@invisiblethingslab.com/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6FO3y47iLORSD1yX
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.3.0-rc3-00001-ga3ed3eaa6b7a-dirty (user@deve=
l-3rdparty) (gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4), GNU ld version 2=
=2E38-25.fc37) #332 SMP PREEMPT_DYNAMIC Wed Mar 29 04:30:22 CEST 2023
[    0.000000] Command line: BOOT_IMAGE=3D(http)/test1/vmlinuz inst.stage2=
=3Dhttp://192.168.190.2/rescue-qubes plymouth.ignore-serial-consoles inst.s=
shd rescue inst.ks=3Dhttp://192.168.190.2/test4/ks.cfg console=3Dhvc0 conso=
le=3Dtty0 earlyprintk=3Dxdbc,keep
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000008efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000008f000-0x000000000008ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000090000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009efffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f0cfff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000009f0d000-0x00000000b6e81fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b6e82000-0x00000000b7c81fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b7c82000-0x00000000b8381fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000b8382000-0x00000000b8401fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000b8402000-0x00000000cbffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cc000000-0x00000000cdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000cf000000-0x00000000cfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fde00000-0x00000000fdefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedf1000-0x00000000fedf1fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000040f33ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000040f340000-0x000000042fffffff] reser=
ved
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xa7aa7018-0xa7ab4657] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xa7aa7018-0xa7ab4657] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000008ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000008f000-0x000000000008ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000090000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009efff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009f00000-0x0000000009f0cf=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000009f0d000-0x00000000a7aa70=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000a7aa7018-0x00000000a7ab46=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000a7ab4658-0x00000000b6e81f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000b6e82000-0x00000000b7c81f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000b7c82000-0x00000000b8381f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000b8382000-0x00000000b8401f=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000b8402000-0x00000000cbffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000cc000000-0x00000000cdffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000cf000000-0x00000000cfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f8000000-0x00000000fbffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fde00000-0x00000000fdefff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed80f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedf1000-0x00000000fedf1f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000040f33ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000040f340000-0x000000042fffff=
ff] reserved
[    0.000000] efi: EFI v2.6 by HP
[    0.000000] efi: ACPI=3D0xb8401000 ACPI 2.0=3D0xb8401014 SMBIOS=3D0xb755=
4000 SMBIOS 3.0=3D0xb7552000 ESRT=3D0xb7550298 TPMFinalLog=3D0xb82d5000 MEM=
ATTR=3D0xb3878198 RNG=3D0xb83b1018 TPMEventLog=3D0xa7ab5018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem95: MMIO range=3D[0xf8000000-0xfbffffff] (64M=
B) from e820 map
[    0.000000] e820: remove [mem 0xf8000000-0xfbffffff] reserved
[    0.000000] efi: Remove mem96: MMIO range=3D[0xfde00000-0xfdefffff] (1MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfde00000-0xfdefffff] reserved
[    0.000000] efi: Not removing mem97: MMIO range=3D[0xfec00000-0xfec00fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem98: MMIO range=3D[0xfec10000-0xfec10fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem99: MMIO range=3D[0xfed80000-0xfed80fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem100: MMIO range=3D[0xfedf1000-0xfedf1ff=
f] (4KB) from e820 map
[    0.000000] efi: Not removing mem101: MMIO range=3D[0xfee00000-0xfee00ff=
f] (4KB) from e820 map
[    0.000000] efi: Remove mem102: MMIO range=3D[0xff000000-0xffffffff] (16=
MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: HP HP ProBook 445 G7/8730, BIOS S79 Ver. 01.10.00 07/20=
/2022
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2370.619 MHz processor
[    0.000514] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000515] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000521] last_pfn =3D 0x40f340 max_arch_pfn =3D 0x400000000
[    0.000526] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000867] last_pfn =3D 0xcc000 max_arch_pfn =3D 0x400000000
[    0.001000] esrt: Reserving ESRT space from 0x00000000b7550298 to 0x0000=
0000b75502f8.
[    0.001000] Using GB pages for direct mapping
[    0.001000] Secure boot disabled
[    0.001000] RAMDISK: [mem 0x4a7f8000-0x5d5c3fff]
[    0.001000] ACPI: Early table checksum verification disabled
[    0.001000] ACPI: RSDP 0x00000000B8401014 000024 (v02 HPQOEM)
[    0.001000] ACPI: XSDT 0x00000000B83E3188 00013C (v01 HPQOEM SLIC-BPC 00=
000001      01000013)
[    0.001000] ACPI: FACP 0x00000000B83EB000 00010C (v05 HPQOEM SLIC-BPC 00=
000001 HP   00000001)
[    0.001000] ACPI: DSDT 0x00000000B83D0000 012FAD (v02 HPQOEM 8730     00=
000000 INTL 20160527)
[    0.001000] ACPI: FACS 0x00000000B82C1000 000040
[    0.001000] ACPI: SSDT 0x00000000B83FF000 0002D7 (v01 HP     NVTEC    00=
000001 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83FE000 00012A (v02 HP     ShmTable 00=
000001 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83F6000 00723C (v02 AMD    AmdTable 00=
000002 MSFT 04000000)
[    0.001000] ACPI: IVRS 0x00000000B83F5000 0001A4 (v02 AMD    AmdTable 00=
000001 AMD  00000000)
[    0.001000] ACPI: SSDT 0x00000000B83F4000 000257 (v01 AMD    STD3     00=
000001 INTL 20160527)
[    0.001000] ACPI: UEFI 0x00000000B82E4000 000042 (v01 HPQOEM EDK2     00=
000002      01000013)
[    0.001000] ACPI: RTMA 0x00000000B83F2000 00009E (v01 HP     _HBMART_ 00=
001000 HP   00000001)
[    0.001000] ACPI: SSDT 0x00000000B83F0000 001575 (v02 HP     UcsiAcpi 00=
000001 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83EF000 0000FB (v02 HP     UcsiCntr 00=
000001 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83EE000 0003CE (v02 HPQOEM Tpm2Tabl 00=
001000 INTL 20160527)
[    0.001000] ACPI: TPM2 0x00000000B83ED000 000034 (v03 HPQOEM EDK2     00=
000002      01000013)
[    0.001000] ACPI: OEML 0x00000000B83EC000 000028 (v03 HPQOEM EDK2     00=
000002      01000013)
[    0.001000] ACPI: ASF! 0x00000000B83EA000 00006E (v32 HPQOEM 8730     00=
000001 HP   00000001)
[    0.001000] ACPI: MSDM 0x00000000B83E9000 000055 (v03 HPQOEM SLIC-BPC 00=
000000 HP   00000001)
[    0.001000] ACPI: SLIC 0x00000000B83E8000 000176 (v01 HPQOEM SLIC-BPC 00=
000001 HP   00000001)
[    0.001000] ACPI: WSMT 0x00000000B83E7000 000028 (v01 HPQOEM 8730     00=
000001 HP   00000001)
[    0.001000] ACPI: HPET 0x00000000B83E6000 000038 (v01 HPQOEM 8730     00=
000001 HP   00000001)
[    0.001000] ACPI: APIC 0x00000000B83E5000 000138 (v02 HPQOEM 8730     00=
000001 HP   00000001)
[    0.001000] ACPI: MCFG 0x00000000B83E4000 00003C (v01 HPQOEM 8730     00=
000001 HP   00000001)
[    0.001000] ACPI: SSDT 0x00000000B83CE000 001500 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.001000] ACPI: CRAT 0x00000000B8400000 000BA8 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.001000] ACPI: CDIT 0x00000000B83CD000 000029 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.001000] ACPI: SSDT 0x00000000B83CC000 00020D (v01 HP     HPNBCONV 00=
001000 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83CB000 0008F5 (v01 HP     HPADNBWL 00=
001000 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83CA000 000032 (v01 HP     HPCONDEV 00=
001000 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83C9000 000069 (v01 HP     HPCAHWID 00=
001000 INTL 20160527)
[    0.001000] ACPI: VFCT 0x00000000B83BB000 00D684 (v01 HPQOEM SLIC-BPC 00=
000001 AMD  31504F47)
[    0.001000] ACPI: SSDT 0x00000000B83BA000 000149 (v01 AMD    AmdTable 00=
000001 INTL 20160527)
[    0.001000] ACPI: FPDT 0x00000000B83B9000 000044 (v01 HPQOEM EDK2     00=
000002      01000013)
[    0.001000] ACPI: SSDT 0x00000000B83B5000 0032BA (v01 AMD    AmdTable 00=
000001 INTL 20160527)
[    0.001000] ACPI: BGRT 0x00000000B83B4000 000038 (v01 HPQOEM EDK2     00=
000002      01000013)
[    0.001000] ACPI: SSDT 0x00000000B83B3000 00008D (v01 AMD    AmdTable 00=
000001 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83B2000 00089D (v01 AMD    AmdTable 00=
000001 INTL 20160527)
[    0.001000] ACPI: SSDT 0x00000000B83F3000 0002F9 (v02 HP     PwrCtlEv 00=
000001 INTL 20160527)
[    0.001000] ACPI: Reserving FACP table memory at [mem 0xb83eb000-0xb83eb=
10b]
[    0.001000] ACPI: Reserving DSDT table memory at [mem 0xb83d0000-0xb83e2=
fac]
[    0.001000] ACPI: Reserving FACS table memory at [mem 0xb82c1000-0xb82c1=
03f]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83ff000-0xb83ff=
2d6]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83fe000-0xb83fe=
129]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83f6000-0xb83fd=
23b]
[    0.001000] ACPI: Reserving IVRS table memory at [mem 0xb83f5000-0xb83f5=
1a3]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83f4000-0xb83f4=
256]
[    0.001000] ACPI: Reserving UEFI table memory at [mem 0xb82e4000-0xb82e4=
041]
[    0.001000] ACPI: Reserving RTMA table memory at [mem 0xb83f2000-0xb83f2=
09d]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83f0000-0xb83f1=
574]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83ef000-0xb83ef=
0fa]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83ee000-0xb83ee=
3cd]
[    0.001000] ACPI: Reserving TPM2 table memory at [mem 0xb83ed000-0xb83ed=
033]
[    0.001000] ACPI: Reserving OEML table memory at [mem 0xb83ec000-0xb83ec=
027]
[    0.001000] ACPI: Reserving ASF! table memory at [mem 0xb83ea000-0xb83ea=
06d]
[    0.001000] ACPI: Reserving MSDM table memory at [mem 0xb83e9000-0xb83e9=
054]
[    0.001000] ACPI: Reserving SLIC table memory at [mem 0xb83e8000-0xb83e8=
175]
[    0.001000] ACPI: Reserving WSMT table memory at [mem 0xb83e7000-0xb83e7=
027]
[    0.001000] ACPI: Reserving HPET table memory at [mem 0xb83e6000-0xb83e6=
037]
[    0.001000] ACPI: Reserving APIC table memory at [mem 0xb83e5000-0xb83e5=
137]
[    0.001000] ACPI: Reserving MCFG table memory at [mem 0xb83e4000-0xb83e4=
03b]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83ce000-0xb83cf=
4ff]
[    0.001000] ACPI: Reserving CRAT table memory at [mem 0xb8400000-0xb8400=
ba7]
[    0.001000] ACPI: Reserving CDIT table memory at [mem 0xb83cd000-0xb83cd=
028]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83cc000-0xb83cc=
20c]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83cb000-0xb83cb=
8f4]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83ca000-0xb83ca=
031]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83c9000-0xb83c9=
068]
[    0.001000] ACPI: Reserving VFCT table memory at [mem 0xb83bb000-0xb83c8=
683]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83ba000-0xb83ba=
148]
[    0.001000] ACPI: Reserving FPDT table memory at [mem 0xb83b9000-0xb83b9=
043]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83b5000-0xb83b8=
2b9]
[    0.001000] ACPI: Reserving BGRT table memory at [mem 0xb83b4000-0xb83b4=
037]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83b3000-0xb83b3=
08c]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83b2000-0xb83b2=
89c]
[    0.001000] ACPI: Reserving SSDT table memory at [mem 0xb83f3000-0xb83f3=
2f8]
[    0.001000] No NUMA configuration found
[    0.001000] Faking a node at [mem 0x0000000000000000-0x000000040f33ffff]
[    0.001000] NODE_DATA(0) allocated [mem 0x40f33c000-0x40f33ffff]
[    0.001000] USBCMD before: 0x0
[    0.001000] USBSTS before: 0x19
[    0.001000] USBCMD after: 0x1
[    0.001000] USBSTS after: 0x18
[    0.001000] waiting for connection timed out
[    0.001000] xhci_dbc:early_xdbc_setup_hardware: failed to setup the conn=
ection to host
[    0.001000] Zone ranges:
[    0.001000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.001000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.001000]   Normal   [mem 0x0000000100000000-0x000000040f33ffff]
[    0.001000] Movable zone start for each node
[    0.001000] Early memory node ranges
[    0.001000]   node   0: [mem 0x0000000000001000-0x000000000008efff]
[    0.001000]   node   0: [mem 0x0000000000090000-0x000000000009ffff]
[    0.001000]   node   0: [mem 0x0000000000100000-0x0000000009efffff]
[    0.001000]   node   0: [mem 0x0000000009f0d000-0x00000000b6e81fff]
[    0.001000]   node   0: [mem 0x00000000b8402000-0x00000000cbffffff]
[    0.001000]   node   0: [mem 0x0000000100000000-0x000000040f33ffff]
[    0.001000] Initmem setup node 0 [mem 0x0000000000001000-0x000000040f33f=
fff]
[    0.001000] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.001000] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.001000] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.001000] On node 0, zone DMA32: 13 pages in unavailable ranges
[    0.001000] On node 0, zone DMA32: 5504 pages in unavailable ranges
[    0.001000] On node 0, zone Normal: 16384 pages in unavailable ranges
[    0.001000] On node 0, zone Normal: 3264 pages in unavailable ranges
[    0.001000] ACPI: PM-Timer IO Port: 0x408
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.001000] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.001000] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0=
-23
[    0.001000] IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 2=
4-55
[    0.001000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.001000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.001000] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.001000] ACPI: HPET id: 0x10228210 base: 0xfed00000
[    0.001000] e820: update [mem 0xb2be3000-0xb2bf6fff] usable =3D=3D> rese=
rved
[    0.001000] smpboot: Allowing 6 CPUs, 0 hotplug CPUs
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0x0008f000-0=
x0008ffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0x09f00000-0=
x09f0cfff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xa7aa7000-0=
xa7aa7fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xa7ab4000-0=
xa7ab4fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xb2be3000-0=
xb2bf6fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xb6e82000-0=
xb7c81fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xb7c82000-0=
xb8381fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xb8382000-0=
xb8401fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xcc000000-0=
xcdffffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xce000000-0=
xceffffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xcf000000-0=
xcfffffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xd0000000-0=
xfebfffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0=
xfec00fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0=
xfec0ffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0=
xfec10fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0=
xfed7ffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfed80fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfed81000-0=
xfedf0fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfedf1000-0=
xfedf1fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfedf2000-0=
xfedfffff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0=
xfee00fff]
[    0.001000] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0=
xffffffff]
[    0.001000] [mem 0xd0000000-0xfebfffff] available for PCI devices
[    0.001000] Booting paravirtualized kernel on bare hardware
[    0.001000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.001000] setup_percpu: NR_CPUS:64 nr_cpumask_bits:6 nr_cpu_ids:6 nr_n=
ode_ids:1
[    0.001000] percpu: Embedded 55 pages/cpu s186984 r8192 d30104 u262144
[    0.001000] pcpu-alloc: s186984 r8192 d30104 u262144 alloc=3D1*2097152
[    0.001000] pcpu-alloc: [0] 0 1 2 3 4 5 - -=20
[    0.001000] Fallback order for Node 0: 0=20
[    0.001000] Built 1 zonelists, mobility grouping on.  Total pages: 39747=
16
[    0.001000] Policy zone: Normal
[    0.001000] Kernel command line: BOOT_IMAGE=3D(http)/test1/vmlinuz inst.=
stage2=3Dhttp://192.168.190.2/rescue-qubes plymouth.ignore-serial-consoles =
inst.sshd rescue inst.ks=3Dhttp://192.168.190.2/test4/ks.cfg console=3Dhvc0=
 console=3Dtty0 earlyprintk=3Dxdbc,keep
[    0.001000] Unknown kernel command line parameters "rescue BOOT_IMAGE=3D=
(http)/test1/vmlinuz", will be passed to user space.
[    0.001000] Dentry cache hash table entries: 2097152 (order: 12, 1677721=
6 bytes, linear)
[    0.001000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 =
bytes, linear)
[    0.001000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.001000] software IO TLB: area num 8.
[    0.001000] Memory: 15369824K/16151876K available (18432K kernel code, 2=
835K rwdata, 6836K rodata, 2876K init, 2852K bss, 781792K reserved, 0K cma-=
reserved)
[    0.001000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D6, N=
odes=3D1
[    0.001000] Dynamic Preempt: voluntary
[    0.001000] rcu: Preemptible hierarchical RCU implementation.
[    0.001000] rcu: 	RCU event tracing is enabled.
[    0.001000] rcu: 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=
=3D6.
[    0.001000] 	Trampoline variant of Tasks RCU enabled.
[    0.001000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.001000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D6
[    0.001000] NR_IRQS: 4352, nr_irqs: 1016, preallocated irqs: 16
[    0.001000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.001000] Console: colour dummy device 80x25
[    0.001000] printk: console [tty0] enabled
[    0.001000] ACPI: Core revision 20221020
[    0.001000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    0.001000] APIC: Switch to symmetric I/O mode setup
[    0.001000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.001000] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x222bcc1ea93, max_idle_ns: 440795209692 ns
[    5.431012] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4741.23 BogoMIPS (lpj=3D2370619)
[    5.431016] pid_max: default: 32768 minimum: 301
[    5.468897] LSM: initializing lsm=3Dcapability,integrity,selinux
[    5.468903] SELinux:  Initializing.
[    5.468967] Mount-cache hash table entries: 32768 (order: 6, 262144 byte=
s, linear)
[    5.469017] Mountpoint-cache hash table entries: 32768 (order: 6, 262144=
 bytes, linear)
[    5.469204] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    5.469250] LVT offset 1 assigned for vector 0xf9
[    5.469356] LVT offset 2 assigned for vector 0xf4
[    5.469382] process: using mwait in idle threads
[    5.469387] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    5.469389] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    5.469396] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    5.469399] Spectre V2 : Mitigation: Retpolines
[    5.469401] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    5.469403] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    5.469405] Spectre V2 : Enabling Speculation Barrier for firmware calls
[    5.469407] RETBleed: Mitigation: untrained return thunk
[    5.469409] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    5.469412] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    5.481981] Freeing SMP alternatives memory: 48K
[    5.584279] smpboot: CPU0: AMD Ryzen 5 4500U with Radeon Graphics (famil=
y: 0x17, model: 0x60, stepping: 0x1)
[    5.584384] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    5.584388] cblist_init_generic: Setting shift to 3 and lim to 1.
[    5.584401] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    5.584419] ... version:                0
[    5.584421] ... bit width:              48
[    5.584422] ... generic registers:      6
[    5.584424] ... value mask:             0000ffffffffffff
[    5.584426] ... max period:             00007fffffffffff
[    5.584427] ... fixed-purpose events:   0
[    5.584428] ... event mask:             000000000000003f
[    5.584510] rcu: Hierarchical SRCU implementation.
[    5.584512] rcu: 	Max phase no-delay instances is 400.
[    5.584722] smp: Bringing up secondary CPUs ...
[    5.584790] x86: Booting SMP configuration:
[    5.584792] .... node  #0, CPUs:      #1 #2 #3 #4 #5
[    5.591021] smp: Brought up 1 node, 6 CPUs
[    5.591027] smpboot: Max logical packages: 1
[    5.591029] smpboot: Total of 6 processors activated (28447.42 BogoMIPS)
[    5.592515] devtmpfs: initialized
[    5.592515] x86/mm: Memory block size: 128MB
[    5.593508] ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f0=
cfff] (53248 bytes)
[    5.593508] ACPI: PM: Registering ACPI NVS region [mem 0xb7c82000-0xb838=
1fff] (7340032 bytes)
[    5.593508] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    5.593508] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    5.593508] pinctrl core: initialized pinctrl subsystem
[    5.593508] PM: RTC time: 02:32:53, date: 2023-03-29
[    5.593508] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    5.593508] audit: initializing netlink subsys (disabled)
[    5.593508] audit: type=3D2000 audit(1680057173.167:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    5.593508] thermal_sys: Registered thermal governor 'step_wise'
[    5.593508] thermal_sys: Registered thermal governor 'user_space'
[    5.593508] cpuidle: using governor menu
[    5.593508] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    5.594036] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000=
-0xfbffffff] (base 0xf8000000)
[    5.594042] PCI: not using MMCONFIG
[    5.594044] PCI: Using configuration type 1 for base access
[    5.594046] PCI: Using configuration type 1 for extended access
[    5.594233] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    5.594257] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    5.594257] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    5.594257] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    5.594257] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    5.594257] cryptd: max_cpu_qlen set to 1000
[    5.594257] ACPI: Added _OSI(Module Device)
[    5.594257] ACPI: Added _OSI(Processor Device)
[    5.594257] ACPI: Added _OSI(3.0 _SCP Extensions)
[    5.594257] ACPI: Added _OSI(Processor Aggregator Device)
[    5.599087] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.B=
USB.SAT1], AE_NOT_FOUND (20221020/dswload2-162)
[    5.599093] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202210=
20/psobject-220)
[    5.599097] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    5.601044] ACPI: 18 ACPI AML tables successfully acquired and loaded
[    5.674765] ACPI: EC: EC started
[    5.674765] ACPI: EC: interrupt blocked
[    5.675103] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    5.692715] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    5.692718] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions
[    5.692721] ACPI: Interpreter enabled
[    5.692736] ACPI: PM: (supports S0 S3 S4 S5)
[    5.692738] ACPI: Using IOAPIC for interrupt routing
[    5.693042] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000=
-0xfbffffff] (base 0xf8000000)
[    5.694094] [Firmware Info]: PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff=
] not reserved in ACPI motherboard resources
[    5.694098] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved as Efi=
MemoryMappedIO
[    5.694105] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    5.694108] PCI: Using E820 reservations for host bridge windows
[    5.694300] ACPI: Enabled 8 GPEs in block 00 to 1F
[    5.694672] ACPI: \_SB_.PCI0.GP13.NCRD.WLRT: New power resource
[    5.695897] ACPI: \_SB_.PCI0.BUSA.HDEF.APPR: New power resource
[    5.695966] ACPI: \_SB_.P0S0: New power resource
[    5.695983] ACPI: \_SB_.P3S0: New power resource
[    5.698219] ACPI: \_SB_.P0S1: New power resource
[    5.698236] ACPI: \_SB_.P3S1: New power resource
[    5.699058] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    5.699064] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    5.699092] acpi PNP0A08:00: _OSC: platform does not support [LTR]
[    5.699137] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapability]
[    5.699139] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using B=
IOS configuration
[    5.699148] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus 00-3f] only partially covers this bridge
[    5.699291] PCI host bridge to bus 0000:00
[    5.699293] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    5.699296] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    5.699298] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    5.699301] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000cfff=
f window]
[    5.699303] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000efff=
f window]
[    5.699306] pci_bus 0000:00: root bus resource [mem 0xd0000000-0xf7fffff=
f window]
[    5.699308] pci_bus 0000:00: root bus resource [mem 0xfc000000-0xfeaffff=
f window]
[    5.699311] pci_bus 0000:00: root bus resource [bus 00-ff]
[    5.699326] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
[    5.699396] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
[    5.699464] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
[    5.699528] pci 0000:00:01.2: [1022:1634] type 01 class 0x060400
[    5.699585] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    5.699668] pci 0000:00:01.3: [1022:1634] type 01 class 0x060400
[    5.699723] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    5.699803] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
[    5.699862] pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
[    5.699917] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    5.700007] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
[    5.700066] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
[    5.700087] pci 0000:00:08.1: enabling Extended Tags
[    5.700116] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    5.700205] pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
[    5.700226] pci 0000:00:08.2: enabling Extended Tags
[    5.700255] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    5.700341] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    5.700449] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    5.700569] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
[    5.700608] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
[    5.700647] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
[    5.700690] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
[    5.700729] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
[    5.700768] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
[    5.700808] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
[    5.700849] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
[    5.700932] pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
[    5.700950] pci 0000:01:00.0: reg 0x10: [io  0x3000-0x30ff]
[    5.700973] pci 0000:01:00.0: reg 0x18: [mem 0xe0904000-0xe0904fff 64bit]
[    5.700988] pci 0000:01:00.0: reg 0x20: [mem 0xe0900000-0xe0903fff 64bit]
[    5.701076] pci 0000:01:00.0: supports D1 D2
[    5.701078] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    5.701220] pci 0000:00:01.2: PCI bridge to [bus 01]
[    5.701224] pci 0000:00:01.2:   bridge window [io  0x3000-0x3fff]
[    5.701227] pci 0000:00:01.2:   bridge window [mem 0xe0900000-0xe09fffff]
[    5.701473] pci 0000:02:00.0: [8086:2723] type 00 class 0x028000
[    5.701528] pci 0000:02:00.0: reg 0x10: [mem 0xe0800000-0xe0803fff 64bit]
[    5.701696] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    5.702398] pci 0000:00:01.3: PCI bridge to [bus 02]
[    5.702403] pci 0000:00:01.3:   bridge window [mem 0xe0800000-0xe08fffff]
[    5.702443] pci 0000:03:00.0: [10ec:522a] type 00 class 0xff0000
[    5.702457] pci 0000:03:00.0: reg 0x10: [mem 0xe0700000-0xe0700fff]
[    5.702558] pci 0000:03:00.0: supports D1 D2
[    5.702559] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
[    5.702695] pci 0000:00:02.1: PCI bridge to [bus 03]
[    5.702699] pci 0000:00:02.1:   bridge window [mem 0xe0700000-0xe07fffff]
[    5.702729] pci 0000:04:00.0: [1002:1636] type 00 class 0x030000
[    5.702741] pci 0000:04:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit=
 pref]
[    5.702750] pci 0000:04:00.0: reg 0x18: [mem 0xe0000000-0xe01fffff 64bit=
 pref]
[    5.702756] pci 0000:04:00.0: reg 0x20: [io  0x2000-0x20ff]
[    5.702762] pci 0000:04:00.0: reg 0x24: [mem 0xe0600000-0xe067ffff]
[    5.702771] pci 0000:04:00.0: enabling Extended Tags
[    5.702782] pci 0000:04:00.0: BAR 0: assigned to efifb
[    5.702819] pci 0000:04:00.0: PME# supported from D1 D2 D3hot D3cold
[    5.702838] pci 0000:04:00.0: 126.016 Gb/s available PCIe bandwidth, lim=
ited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s wit=
h 16.0 GT/s PCIe x16 link)
[    5.702910] pci 0000:04:00.1: [1002:1637] type 00 class 0x040300
[    5.702918] pci 0000:04:00.1: reg 0x10: [mem 0xe06c8000-0xe06cbfff]
[    5.702939] pci 0000:04:00.1: enabling Extended Tags
[    5.702967] pci 0000:04:00.1: PME# supported from D1 D2 D3hot D3cold
[    5.703017] pci 0000:04:00.2: [1022:15df] type 00 class 0x108000
[    5.703030] pci 0000:04:00.2: reg 0x18: [mem 0xe0500000-0xe05fffff]
[    5.703040] pci 0000:04:00.2: reg 0x24: [mem 0xe06cc000-0xe06cdfff]
[    5.703048] pci 0000:04:00.2: enabling Extended Tags
[    5.703122] pci 0000:04:00.3: [1022:1639] type 00 class 0x0c0330
[    5.703133] pci 0000:04:00.3: reg 0x10: [mem 0xe0300000-0xe03fffff 64bit]
[    5.703157] pci 0000:04:00.3: enabling Extended Tags
[    5.703186] pci 0000:04:00.3: PME# supported from D0 D3hot D3cold
[    5.703242] pci 0000:04:00.4: [1022:1639] type 00 class 0x0c0330
[    5.703253] pci 0000:04:00.4: reg 0x10: [mem 0xe0400000-0xe04fffff 64bit]
[    5.703277] pci 0000:04:00.4: enabling Extended Tags
[    5.703306] pci 0000:04:00.4: PME# supported from D0 D3hot D3cold
[    5.703363] pci 0000:04:00.5: [1022:15e2] type 00 class 0x048000
[    5.703371] pci 0000:04:00.5: reg 0x10: [mem 0xe0680000-0xe06bffff]
[    5.703392] pci 0000:04:00.5: enabling Extended Tags
[    5.703419] pci 0000:04:00.5: PME# supported from D0 D3hot D3cold
[    5.703468] pci 0000:04:00.6: [1022:15e3] type 00 class 0x040300
[    5.703476] pci 0000:04:00.6: reg 0x10: [mem 0xe06c0000-0xe06c7fff]
[    5.703498] pci 0000:04:00.6: enabling Extended Tags
[    5.703524] pci 0000:04:00.6: PME# supported from D0 D3hot D3cold
[    5.703591] pci 0000:00:08.1: PCI bridge to [bus 04]
[    5.703595] pci 0000:00:08.1:   bridge window [io  0x2000-0x2fff]
[    5.703598] pci 0000:00:08.1:   bridge window [mem 0xe0300000-0xe06fffff]
[    5.703602] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff=
 64bit pref]
[    5.703630] pci 0000:05:00.0: [1022:7901] type 00 class 0x010601
[    5.703658] pci 0000:05:00.0: reg 0x24: [mem 0xe0201000-0xe02017ff]
[    5.703668] pci 0000:05:00.0: enabling Extended Tags
[    5.703722] pci 0000:05:00.0: 126.016 Gb/s available PCIe bandwidth, lim=
ited by 8.0 GT/s PCIe x16 link at 0000:00:08.2 (capable of 252.048 Gb/s wit=
h 16.0 GT/s PCIe x16 link)
[    5.703778] pci 0000:05:00.1: [1022:7901] type 00 class 0x010601
[    5.703806] pci 0000:05:00.1: reg 0x24: [mem 0xe0200000-0xe02007ff]
[    5.703815] pci 0000:05:00.1: enabling Extended Tags
[    5.703885] pci 0000:00:08.2: PCI bridge to [bus 05]
[    5.703889] pci 0000:00:08.2:   bridge window [mem 0xe0200000-0xe02fffff]
[    5.704784] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    5.704787] ACPI: PCI: Interrupt link LNKA disabled
[    5.704840] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    5.704842] ACPI: PCI: Interrupt link LNKB disabled
[    5.704882] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    5.704884] ACPI: PCI: Interrupt link LNKC disabled
[    5.704935] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    5.704937] ACPI: PCI: Interrupt link LNKD disabled
[    5.704983] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    5.704985] ACPI: PCI: Interrupt link LNKE disabled
[    5.705025] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    5.705026] ACPI: PCI: Interrupt link LNKF disabled
[    5.705063] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    5.705065] ACPI: PCI: Interrupt link LNKG disabled
[    5.705102] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    5.705104] ACPI: PCI: Interrupt link LNKH disabled
[    5.705945] ACPI: EC: interrupt unblocked
[    5.705947] ACPI: EC: event unblocked
[    5.705953] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    5.705955] ACPI: EC: GPE=3D0x3
[    5.705956] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization comp=
lete
[    5.705959] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions =
and events
[    5.705992] iommu: Default domain type: Translated=20
[    5.705994] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    5.706041] SCSI subsystem initialized
[    5.706047] libata version 3.00 loaded.
[    5.706047] ACPI: bus type USB registered
[    5.706047] usbcore: registered new interface driver usbfs
[    5.706047] usbcore: registered new interface driver hub
[    5.706048] usbcore: registered new device driver usb
[    5.706058] pps_core: LinuxPPS API ver. 1 registered
[    5.706060] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    5.706064] PTP clock support registered
[    5.707008] efivars: Registered efivars operations
[    5.707031] Advanced Linux Sound Architecture Driver Initialized.
[    5.707109] NetLabel: Initializing
[    5.707110] NetLabel:  domain hash size =3D 128
[    5.707112] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    5.707125] NetLabel:  unlabeled traffic allowed by default
[    5.708028] PCI: Using ACPI for IRQ routing
[    5.709442] PCI: pci_cache_line_size set to 64 bytes
[    5.709890] e820: reserve RAM buffer [mem 0x0008f000-0x0008ffff]
[    5.709891] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    5.709892] e820: reserve RAM buffer [mem 0xa7aa7018-0xa7ffffff]
[    5.709893] e820: reserve RAM buffer [mem 0xb2be3000-0xb3ffffff]
[    5.709893] e820: reserve RAM buffer [mem 0xb6e82000-0xb7ffffff]
[    5.709894] e820: reserve RAM buffer [mem 0x40f340000-0x40fffffff]
[    5.710012] pci 0000:04:00.0: vgaarb: setting as boot VGA device
[    5.710015] pci 0000:04:00.0: vgaarb: bridge control possible
[    5.710016] pci 0000:04:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    5.710020] vgaarb: loaded
[    5.710332] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    5.710337] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    5.713036] clocksource: Switched to clocksource tsc-early
[    5.713087] VFS: Disk quotas dquot_6.6.0
[    5.713094] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    5.713128] pnp: PnP ACPI init
[    5.713233] system 00:01: [io  0x0400-0x04cf] has been reserved
[    5.713236] system 00:01: [io  0x04d0-0x04d1] has been reserved
[    5.713238] system 00:01: [io  0x04d6] has been reserved
[    5.713240] system 00:01: [io  0x0680-0x06ff] has been reserved
[    5.713242] system 00:01: [io  0x077a] has been reserved
[    5.713244] system 00:01: [io  0x0c00-0x0c01] has been reserved
[    5.713246] system 00:01: [io  0x0c14] has been reserved
[    5.713248] system 00:01: [io  0x0c50-0x0c52] has been reserved
[    5.713251] system 00:01: [io  0x0c6c] has been reserved
[    5.713252] system 00:01: [io  0x0c6f] has been reserved
[    5.713254] system 00:01: [io  0x0cd0-0x0cdb] has been reserved
[    5.713257] system 00:01: [io  0x0840-0x0847] has been reserved
[    5.713293] system 00:02: [mem 0x000e0000-0x000fffff] could not be reser=
ved
[    5.713344] system 00:04: [io  0x0200-0x027f] has been reserved
[    5.713346] system 00:04: [mem 0xfedf1000-0xfedf1fff] has been reserved
[    5.713382] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    5.713385] system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
[    5.713387] system 00:05: [mem 0xfec20000-0xfec20fff] has been reserved
[    5.713781] pnp: PnP ACPI: found 6 devices
[    5.719318] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    5.719367] NET: Registered PF_INET protocol family
[    5.719719] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s, linear)
[    5.722462] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5,=
 131072 bytes, linear)
[    5.722480] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    5.722485] TCP established hash table entries: 131072 (order: 8, 104857=
6 bytes, linear)
[    5.722621] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    5.722919] TCP: Hash tables configured (established 131072 bind 65536)
[    5.722963] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    5.723004] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, l=
inear)
[    5.723075] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    5.723176] RPC: Registered named UNIX socket transport module.
[    5.723178] RPC: Registered udp transport module.
[    5.723179] RPC: Registered tcp transport module.
[    5.723181] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    5.723443] pci 0000:00:01.3: bridge window [io  0x1000-0x0fff] to [bus =
02] add_size 1000
[    5.723447] pci 0000:00:01.3: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 02] add_size 200000 add_align 100000
[    5.723452] pci 0000:00:02.1: bridge window [io  0x1000-0x0fff] to [bus =
03] add_size 1000
[    5.723455] pci 0000:00:02.1: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 03] add_size 200000 add_align 100000
[    5.723468] pci 0000:00:01.3: BAR 9: assigned [mem 0xe0a00000-0xe0bfffff=
 64bit pref]
[    5.723471] pci 0000:00:02.1: BAR 9: assigned [mem 0xe0c00000-0xe0dfffff=
 64bit pref]
[    5.723476] pci 0000:00:01.3: BAR 7: assigned [io  0x1000-0x1fff]
[    5.723479] pci 0000:00:02.1: BAR 7: assigned [io  0x4000-0x4fff]
[    5.723483] pci 0000:00:01.2: PCI bridge to [bus 01]
[    5.723486] pci 0000:00:01.2:   bridge window [io  0x3000-0x3fff]
[    5.723491] pci 0000:00:01.2:   bridge window [mem 0xe0900000-0xe09fffff]
[    5.723496] pci 0000:00:01.3: PCI bridge to [bus 02]
[    5.723498] pci 0000:00:01.3:   bridge window [io  0x1000-0x1fff]
[    5.723501] pci 0000:00:01.3:   bridge window [mem 0xe0800000-0xe08fffff]
[    5.723505] pci 0000:00:01.3:   bridge window [mem 0xe0a00000-0xe0bfffff=
 64bit pref]
[    5.723509] pci 0000:00:02.1: PCI bridge to [bus 03]
[    5.723511] pci 0000:00:02.1:   bridge window [io  0x4000-0x4fff]
[    5.723514] pci 0000:00:02.1:   bridge window [mem 0xe0700000-0xe07fffff]
[    5.723517] pci 0000:00:02.1:   bridge window [mem 0xe0c00000-0xe0dfffff=
 64bit pref]
[    5.723523] pci 0000:00:08.1: PCI bridge to [bus 04]
[    5.723526] pci 0000:00:08.1:   bridge window [io  0x2000-0x2fff]
[    5.723529] pci 0000:00:08.1:   bridge window [mem 0xe0300000-0xe06fffff]
[    5.723532] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff=
 64bit pref]
[    5.723536] pci 0000:00:08.2: PCI bridge to [bus 05]
[    5.723540] pci 0000:00:08.2:   bridge window [mem 0xe0200000-0xe02fffff]
[    5.723546] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    5.723548] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    5.723550] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    5.723553] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff windo=
w]
[    5.723555] pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff windo=
w]
[    5.723557] pci_bus 0000:00: resource 9 [mem 0xd0000000-0xf7ffffff windo=
w]
[    5.723559] pci_bus 0000:00: resource 10 [mem 0xfc000000-0xfeafffff wind=
ow]
[    5.723561] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    5.723563] pci_bus 0000:01: resource 1 [mem 0xe0900000-0xe09fffff]
[    5.723565] pci_bus 0000:02: resource 0 [io  0x1000-0x1fff]
[    5.723567] pci_bus 0000:02: resource 1 [mem 0xe0800000-0xe08fffff]
[    5.723569] pci_bus 0000:02: resource 2 [mem 0xe0a00000-0xe0bfffff 64bit=
 pref]
[    5.723572] pci_bus 0000:03: resource 0 [io  0x4000-0x4fff]
[    5.723574] pci_bus 0000:03: resource 1 [mem 0xe0700000-0xe07fffff]
[    5.723576] pci_bus 0000:03: resource 2 [mem 0xe0c00000-0xe0dfffff 64bit=
 pref]
[    5.723578] pci_bus 0000:04: resource 0 [io  0x2000-0x2fff]
[    5.723580] pci_bus 0000:04: resource 1 [mem 0xe0300000-0xe06fffff]
[    5.723582] pci_bus 0000:04: resource 2 [mem 0xd0000000-0xe01fffff 64bit=
 pref]
[    5.723585] pci_bus 0000:05: resource 1 [mem 0xe0200000-0xe02fffff]
[    5.723885] pci 0000:04:00.1: D0 power state depends on 0000:04:00.0
[    5.723893] pci 0000:04:00.3: extending delay after power-on from D3hot =
to 20 msec
[    5.724049] pci 0000:04:00.4: extending delay after power-on from D3hot =
to 20 msec
[    5.724101] PCI: CLS 64 bytes, default 64
[    5.724215] Unpacking initramfs...
[    5.725136] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
[    5.725140] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
[    5.725142] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
[    5.725144] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
[    5.725146] AMD-Vi: Using global IVHD EFR:0x206d73ef22254ade, EFR2:0x0
[    5.725199] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters support=
ed
[    5.725241] pci 0000:00:01.0: Adding to iommu group 0
[    5.725252] pci 0000:00:01.2: Adding to iommu group 1
[    5.725262] pci 0000:00:01.3: Adding to iommu group 2
[    5.725276] pci 0000:00:02.0: Adding to iommu group 3
[    5.725285] pci 0000:00:02.1: Adding to iommu group 4
[    5.725302] pci 0000:00:08.0: Adding to iommu group 5
[    5.725311] pci 0000:00:08.1: Adding to iommu group 5
[    5.725319] pci 0000:00:08.2: Adding to iommu group 5
[    5.725333] pci 0000:00:14.0: Adding to iommu group 6
[    5.725342] pci 0000:00:14.3: Adding to iommu group 6
[    5.725377] pci 0000:00:18.0: Adding to iommu group 7
[    5.725385] pci 0000:00:18.1: Adding to iommu group 7
[    5.725394] pci 0000:00:18.2: Adding to iommu group 7
[    5.725402] pci 0000:00:18.3: Adding to iommu group 7
[    5.725411] pci 0000:00:18.4: Adding to iommu group 7
[    5.725420] pci 0000:00:18.5: Adding to iommu group 7
[    5.725428] pci 0000:00:18.6: Adding to iommu group 7
[    5.725437] pci 0000:00:18.7: Adding to iommu group 7
[    5.725446] pci 0000:01:00.0: Adding to iommu group 8
[    5.725455] pci 0000:02:00.0: Adding to iommu group 9
[    5.725465] pci 0000:03:00.0: Adding to iommu group 10
[    5.725479] pci 0000:04:00.0: Adding to iommu group 5
[    5.725483] pci 0000:04:00.1: Adding to iommu group 5
[    5.725487] pci 0000:04:00.2: Adding to iommu group 5
[    5.725491] pci 0000:04:00.3: Adding to iommu group 5
[    5.725496] pci 0000:04:00.4: Adding to iommu group 5
[    5.725500] pci 0000:04:00.5: Adding to iommu group 5
[    5.725504] pci 0000:04:00.6: Adding to iommu group 5
[    5.725509] pci 0000:05:00.0: Adding to iommu group 5
[    5.725513] pci 0000:05:00.1: Adding to iommu group 5
[    5.726032] pci 0000:00:00.2: can't derive routing for PCI INT A
[    5.726036] pci 0000:00:00.2: PCI INT A: not connected
[    5.726181] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    5.726183] AMD-Vi: Extended features (0x206d73ef22254ade, 0x0): PPR X2A=
PIC NX GT IA GA PC GA_vAPIC
[    5.726245] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    5.726247] software IO TLB: mapped [mem 0x00000000c8000000-0x00000000cc=
000000] (64MB)
[    5.726335] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[    5.726338] RAPL PMU: hw unit of domain package 2^-16 Joules
[    5.726340] LVT offset 0 assigned for vector 0x400
[    5.731030] perf: AMD IBS detected (0x000003ff)
[    5.731040] amd_uncore: 4  amd_df counters detected
[    5.731058] amd_uncore: 6  amd_l3 counters detected
[    5.731179] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/b=
ank).
[    5.732859] Initialise system trusted keyrings
[    5.732908] workingset: timestamp_bits=3D56 max_order=3D22 bucket_order=
=3D0
[    5.733012] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    5.733093] NFS: Registering the id_resolver key type
[    5.733103] Key type id_resolver registered
[    5.733107] Key type id_legacy registered
[    5.733151] 9p: Installing v9fs 9p2000 file system support
[    5.735964] Key type asymmetric registered
[    5.735966] Asymmetric key parser 'x509' registered
[    5.735975] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 250)
[    5.735985] io scheduler mq-deadline registered
[    5.735987] io scheduler kyber registered
[    5.736188] pcieport 0000:00:01.2: PME: Signaling with IRQ 26
[    5.736272] pcieport 0000:00:01.3: PME: Signaling with IRQ 27
[    5.736345] pcieport 0000:00:02.1: PME: Signaling with IRQ 28
[    5.736418] pcieport 0000:00:08.1: PME: Signaling with IRQ 29
[    5.736546] pcieport 0000:00:08.2: PME: Signaling with IRQ 30
[    5.736774] ACPI: AC: AC Adapter [AC] (on-line)
[    5.736808] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    5.736823] ACPI: button: Power Button [PWRB]
[    5.736845] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input1
[    5.736857] ACPI: button: Sleep Button [SLPB]
[    5.736875] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input2
[    5.736887] ACPI: button: Lid Switch [LID]
[    5.736908] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input3
[    5.736941] ACPI: button: Power Button [PWRF]
[    5.737228] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[    5.737333] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:0d/LNXVIDEO:00/input/input4
[    5.737365] Monitor-Mwait will be used to enter C-1 state
[    5.737375] ACPI: \_SB_.PLTF.C000: Found 3 idle states
[    5.737475] ACPI: \_SB_.PLTF.C001: Found 3 idle states
[    5.737606] ACPI: \_SB_.PLTF.C002: Found 3 idle states
[    5.737662] ACPI: \_SB_.PLTF.C003: Found 3 idle states
[    5.737739] ACPI: \_SB_.PLTF.C004: Found 3 idle states
[    5.737814] ACPI: \_SB_.PLTF.C005: Found 3 idle states
[    5.741524] thermal LNXTHERM:00: registered as thermal_zone0
[    5.741528] ACPI: thermal: Thermal Zone [CPUZ] (59 C)
[    5.743284] thermal LNXTHERM:01: registered as thermal_zone1
[    5.743288] ACPI: thermal: Thermal Zone [GFXZ] (0 C)
[    5.744634] thermal LNXTHERM:02: registered as thermal_zone2
[    5.744638] ACPI: thermal: Thermal Zone [EXTZ] (38 C)
[    5.745960] thermal LNXTHERM:03: registered as thermal_zone3
[    5.745964] ACPI: thermal: Thermal Zone [LOCZ] (40 C)
[    5.747301] ACPI: \_TZ_.BATZ: Invalid passive threshold
[    5.748187] thermal LNXTHERM:04: registered as thermal_zone4
[    5.748190] ACPI: thermal: Thermal Zone [BATZ] (20 C)
[    5.749126] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index (0x000000=
005) is beyond end of object (length 0x5) (20221020/exoparg2-393)
[    5.749134] ACPI Error: Aborting method \_TZ.GTTP due to previous error =
(AE_AML_PACKAGE_LIMIT) (20221020/psparse-529)
[    5.749141] ACPI Error: Aborting method \_TZ.CHGZ._TMP due to previous e=
rror (AE_AML_PACKAGE_LIMIT) (20221020/psparse-529)
[    5.750058] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index (0x000000=
005) is beyond end of object (length 0x5) (20221020/exoparg2-393)
[    5.750065] ACPI Error: Aborting method \_TZ.GTTP due to previous error =
(AE_AML_PACKAGE_LIMIT) (20221020/psparse-529)
[    5.750072] ACPI Error: Aborting method \_TZ.CHGZ._TMP due to previous e=
rror (AE_AML_PACKAGE_LIMIT) (20221020/psparse-529)
[    5.750236] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    5.750275] ACPI: battery: Slot [BAT0] (battery absent)
[    5.750616] Non-volatile memory driver v1.3
[    5.750619] Linux agpgart interface v0.103
[    5.751064] ACPI: bus type drm_connector registered
[    5.752839] loop: module loaded
[    5.752872] Loading iSCSI transport class v2.0-870.
[    5.752964] iscsi: registered transport (tcp)
[    5.753159] ahci 0000:05:00.0: version 3.0
[    5.753263] ahci 0000:05:00.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x=
3 impl SATA mode
[    5.753268] ahci 0000:05:00.0: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part deso sadm sds=20
[    5.753470] scsi host0: ahci
[    5.753579] scsi host1: ahci
[    5.753606] ata1: SATA max UDMA/133 abar m2048@0xe0201000 port 0xe020110=
0 irq 32
[    5.753611] ata2: SATA max UDMA/133 abar m2048@0xe0201000 port 0xe020118=
0 irq 32
[    5.753742] ahci 0000:05:00.1: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x=
3 impl SATA mode
[    5.753746] ahci 0000:05:00.1: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part=20
[    5.753895] scsi host2: ahci
[    5.753958] scsi host3: ahci
[    5.753988] ata3: SATA max UDMA/133 abar m2048@0xe0200000 port 0xe020010=
0 irq 34
[    5.753993] ata4: SATA max UDMA/133 abar m2048@0xe0200000 port 0xe020018=
0 irq 34
[    5.754111] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[    5.754137] db_root: cannot open: /etc/target
[    5.754257] e100: Intel(R) PRO/100 Network Driver
[    5.754259] e100: Copyright(c) 1999-2006 Intel Corporation
[    5.754267] e1000: Intel(R) PRO/1000 Network Driver
[    5.754269] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    5.754277] e1000e: Intel(R) PRO/1000 Network Driver
[    5.754279] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    5.754291] sky2: driver version 1.30
[    5.754401] r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM=
 control
[    6.063608] ata3: SATA link down (SStatus 0 SControl 300)
[    6.063772] ata4: SATA link down (SStatus 0 SControl 300)
[    6.064421] ata1: SATA link down (SStatus 0 SControl 300)
[    6.225610] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    6.226348] ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK)=
 filtered out
[    6.226393] ata2.00: ATA-10: INTEL SSDSCKKW180H6,  LSF036C, max UDMA/133
[    6.226475] ata2.00: 351651888 sectors, multi 16: LBA48 NCQ (depth 32), =
AA
[    6.226922] ata2.00: Features: Dev-Sleep
[    6.227135] ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK)=
 filtered out
[    6.227438] ata2.00: Read log 0x30 page 0x08 failed, Emask 0x40
[    6.227450] ata2.00: configured for UDMA/133
[    6.690044] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    6.690783] ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK)=
 filtered out
[    6.691511] ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK)=
 filtered out
[    6.691987] ata2.00: configured for UDMA/133
[    6.692235] scsi 1:0:0:0: Direct-Access     ATA      INTEL SSDSCKKW18 03=
6C PQ: 0 ANSI: 5
[    6.692838] sd 1:0:0:0: Attached scsi generic sg0 type 0
[    6.692854] sd 1:0:0:0: [sda] 351651888 512-byte logical blocks: (180 GB=
/168 GiB)
[    6.692870] sd 1:0:0:0: [sda] Write Protect is off
[    6.692875] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    6.692889] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    6.692911] sd 1:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    6.694941]  sda: sda1 sda2 sda3
[    6.695100] sd 1:0:0:0: [sda] Attached SCSI disk
[    6.738049] tsc: Refined TSC clocksource calibration: 2370.534 MHz
[    6.738065] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x222=
b7c4d49a, max_idle_ns: 440795314346 ns
[    6.738351] clocksource: Switched to clocksource tsc
[    8.967018] Freeing initrd memory: 309040K
[    8.969079] modprobe (88) used greatest stack depth: 13384 bytes left
[    8.969385] r8169 0000:01:00.0 eth0: RTL8168h/8111h, 30:24:a9:90:66:fc, =
XID 541, IRQ 36
[    8.969391] r8169 0000:01:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[    8.969409] usbcore: registered new interface driver rtl8150
[    8.969522] usbcore: registered new interface driver usblp
[    8.969529] usbcore: registered new interface driver usb-storage
[    8.969552] i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0x64 irq 1
[    8.969555] i8042: PNP: PS/2 appears to have AUX port disabled, if this =
is incorrect please boot with i8042.nopnp
[    8.969648] xhci_hcd 0000:04:00.3: xHCI Host Controller
[    8.969855] xhci_hcd 0000:04:00.3: new USB bus registered, assigned bus =
number 1
[    8.969891] serio: i8042 KBD port at 0x60,0x64 irq 1
[    8.969953] xhci_hcd 0000:04:00.3: hcc params 0x0268ffe5 hci version 0x1=
10 quirks 0x0000020000000410
[    8.969966] mousedev: PS/2 mouse device common for all mice
[    8.969969] xhci_hcd 0000:04:00.4: xHCI Host Controller
[    8.970108] xhci_hcd 0000:04:00.4: new USB bus registered, assigned bus =
number 2
[    8.970210] xhci_hcd 0000:04:00.4: hcc params 0x0268ffe5 hci version 0x1=
10 quirks 0x0000020000000410
[    8.970222] rtc_cmos 00:00: RTC can wake from S4
[    8.970271] xhci_hcd 0000:04:00.3: xHCI Host Controller
[    8.970318] xhci_hcd 0000:04:00.3: new USB bus registered, assigned bus =
number 3
[    8.970324] xhci_hcd 0000:04:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.970442] rtc_cmos 00:00: registered as rtc0
[    8.970442] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.03
[    8.970454] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.970461] usb usb1: Product: xHCI Host Controller
[    8.970466] usb usb1: Manufacturer: Linux 6.3.0-rc3-00001-ga3ed3eaa6b7a-=
dirty xhci-hcd
[    8.970466] rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    8.970472] fail to initialize ptp_kvm
[    8.970475] usb usb1: SerialNumber: 0000:04:00.3
[    8.970531] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised:=
 dm-devel@redhat.com
[    8.970578] xhci_hcd 0000:04:00.4: xHCI Host Controller
[    8.970618] hub 1-0:1.0: USB hub found
[    8.970654] hub 1-0:1.0: 4 ports detected
[    8.970788] [drm] Initialized simpledrm 1.0.0 20200625 for simple-frameb=
uffer.0 on minor 0
[    8.971440] usb usb3: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.971476] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.03
[    8.971480] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.971483] usb usb3: Product: xHCI Host Controller
[    8.971485] usb usb3: Manufacturer: Linux 6.3.0-rc3-00001-ga3ed3eaa6b7a-=
dirty xhci-hcd
[    8.971488] usb usb3: SerialNumber: 0000:04:00.3
[    8.971591] hub 3-0:1.0: USB hub found
[    8.971602] hub 3-0:1.0: 2 ports detected
[    8.971909] xhci_hcd 0000:04:00.4: new USB bus registered, assigned bus =
number 4
[    8.971925] xhci_hcd 0000:04:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.972001] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.03
[    8.972021] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.972029] usb usb2: Product: xHCI Host Controller
[    8.972034] usb usb2: Manufacturer: Linux 6.3.0-rc3-00001-ga3ed3eaa6b7a-=
dirty xhci-hcd
[    8.972041] usb usb2: SerialNumber: 0000:04:00.4
[    8.972244] hub 2-0:1.0: USB hub found
[    8.972259] hub 2-0:1.0: 4 ports detected
[    8.972653] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.972664] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.03
[    8.972666] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.972667] usb usb4: Product: xHCI Host Controller
[    8.972668] usb usb4: Manufacturer: Linux 6.3.0-rc3-00001-ga3ed3eaa6b7a-=
dirty xhci-hcd
[    8.972668] usb usb4: SerialNumber: 0000:04:00.4
[    8.972753] hub 4-0:1.0: USB hub found
[    8.972757] hub 4-0:1.0: 2 ports detected
[    8.980885] Console: switching to colour frame buffer device 240x67
[    8.987037] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    8.987254] hid: raw HID events driver (C) Jiri Kosina
[    8.987336] usbcore: registered new interface driver usbhid
[    8.987369] usbhid: USB HID core driver
[    8.987625] hp_accel: laptop model unknown, using default axes configura=
tion
[    8.988003] lis3lv02d: 8 bits 3DC sensor found
[    9.000686] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input5
[    9.020319] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3=
lv02d/input/input6
[    9.022254] hp_wmi: query 0x4 returned error 0x5
[    9.026300] input: HP WMI hotkeys as /devices/virtual/input/input7
[    9.030176] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
[    9.030566] snd_hda_intel 0000:04:00.6: enabling device (0000 -> 0002)
[    9.031772] Initializing XFRM netlink socket
[    9.031815] NET: Registered PF_INET6 protocol family
[    9.032464] Segment Routing with IPv6
[    9.032478] In-situ OAM (IOAM) with IPv6
[    9.032505] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    9.032610] NET: Registered PF_PACKET protocol family
[    9.032643] 9pnet: Installing 9P2000 support
[    9.033171] Key type dns_resolver registered
[    9.033249] snd_hda_intel 0000:04:00.1: Cannot probe codecs, giving up
[    9.034652] microcode: CPU3: patch_level=3D0x08600106
[    9.034652] microcode: CPU4: patch_level=3D0x08600106
[    9.034672] microcode: CPU5: patch_level=3D0x08600106
[    9.034675] microcode: CPU0: patch_level=3D0x08600106
[    9.034678] microcode: CPU1: patch_level=3D0x08600106
[    9.034679] microcode: CPU2: patch_level=3D0x08600106
[    9.034782] microcode: Microcode Update Driver: v2.2.
[    9.034788] IPI shorthand broadcast: enabled
[    9.034813] AVX2 version of gcm_enc/dec engaged.
[    9.034976] AES CTR mode by8 optimization enabled
[    9.038061] sched_clock: Marking stable (3613001501, 5425006755)->(90477=
24371, -9716115)
[    9.040405] registered taskstats version 1
[    9.042057] Loading compiled-in X.509 certificates
[    9.043599] ------------[ cut here ]------------
[    9.044535] Debug warning: early ioremap leak of 1 areas detected.
               please boot with early_ioremap_debug and report the dmesg.
[    9.045457] WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:92 check_early_=
ioremap_leak+0x37/0x50
[    9.045882] Modules linked in:
[    9.046267] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.3.0-rc3-00001-ga=
3ed3eaa6b7a-dirty #332
[    9.046622] Hardware name: HP HP ProBook 445 G7/8730, BIOS S79 Ver. 01.1=
0.00 07/20/2022
[    9.046980] RIP: 0010:check_early_ioremap_leak+0x37/0x50
[    9.047672] Code: 48 83 38 01 83 de ff 48 83 c0 08 48 3d 80 90 f7 8e 75 =
ed 85 f6 75 07 89 f0 e9 e9 e5 d0 fe 48 c7 c7 28 7f 35 8e e8 79 7f e1 fd <0f=
> 0b be 01 00 00 00 89 f0 e9 cf e5 d0 fe 66 66 2e 0f 1f 84 00 00
[    9.048208] RSP: 0018:ffffa141c0087eb0 EFLAGS: 00010286
[    9.048780] RAX: 0000000000000000 RBX: ffffffff8eeceb30 RCX: 00000000000=
00000
[    9.049247] RDX: 0000000000000002 RSI: 0000000000000001 RDI: 00000000fff=
fffff
[    9.049679] RBP: 0000000000000007 R08: 00000000ffffdfff R09: 00000000fff=
fdfff
[    9.050102] R10: ffffffff8e65de80 R11: ffffffff8e65de80 R12: ffffa141c00=
87eb8
[    9.050491] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[    9.050876] FS:  0000000000000000(0000) GS:ffff8b8ebf800000(0000) knlGS:=
0000000000000000
[    9.051270] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.051913] CR2: ffff8b8d44c01000 CR3: 0000000283e30000 CR4: 00000000003=
50ef0
[    9.052489] Call Trace:
[    9.053090]  <TASK>
[    9.053559]  do_one_initcall+0x58/0x230
[    9.053990]  kernel_init_freeable+0x1aa/0x2e0
[    9.054414]  ? __pfx_kernel_init+0x10/0x10
[    9.054810]  kernel_init+0x15/0x1b0
[    9.055179]  ret_from_fork+0x2c/0x50
[    9.055765]  </TASK>
[    9.056419] ---[ end trace 0000000000000000 ]---
[    9.056988] PM:   Magic number: 15:846:511
[    9.057549] pcieport 0000:00:01.3: hash matches
[    9.058019] printk: console [netcon0] enabled
[    9.058418] netconsole: network logging started
[    9.058928] acpi_cpufreq: overriding BIOS provided _PSD data
[    9.059743] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    9.063237] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    9.064674] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    9.065311] cfg80211: failed to load regulatory.db
[    9.065781] ALSA device list:
[    9.066262]   No soundcards found.
[    9.067897] Freeing unused kernel image (initmem) memory: 2876K
[    9.085027] Write protecting the kernel read-only data: 26624k
[    9.088950] Freeing unused kernel image (rodata/data gap) memory: 1356K
[    9.121485] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    9.125169] Run /init as init process
[    9.126943]   with arguments:
[    9.126945]     /init
[    9.126946]     rescue
[    9.126948]   with environment:
[    9.126949]     HOME=3D/
[    9.126950]     TERM=3Dlinux
[    9.126951]     BOOT_IMAGE=3D(http)/test1/vmlinuz
[    9.136699] systemd[1]: systemd v245.9-1.fc32 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[    9.137812] systemd[1]: Detected architecture x86-64.
[    9.138208] systemd[1]: Running in initial RAM disk.
[    9.139933] systemd[1]: No hostname configured.
[    9.140342] systemd[1]: Set hostname to <localhost>.
[    9.140757] systemd[1]: Initializing machine ID from random generator.
[    9.156460] systemd-gpt-auto-generator[113]: EFI loader partition unknow=
n, exiting.
[    9.157967] systemd-gpt-auto-generator[113]: (The boot loader did not se=
t EFI variable LoaderDevicePartUUID.)
[    9.178314] systemd[1]: Reached target Initrd Root Device.
[    9.180382] systemd[1]: Reached target Slices.
[    9.182838] systemd[1]: Reached target Swap.
[    9.184997] systemd[1]: Reached target Timers.
[    9.187461] systemd[1]: Listening on Open-iSCSI iscsid Socket.
[    9.190146] systemd[1]: Listening on Open-iSCSI iscsiuio Socket.
[    9.192267] systemd[1]: Listening on Journal Audit Socket.
[    9.195123] systemd[1]: Listening on Journal Socket (/dev/log).
[    9.197336] systemd[1]: Listening on Journal Socket.
[    9.199560] systemd[1]: Listening on udev Control Socket.
[    9.201797] systemd[1]: Listening on udev Kernel Socket.
[    9.203605] systemd[1]: Reached target Sockets.
[    9.205419] systemd[1]: iscsiuio.service: unit configures an IP firewall=
, but the local system does not support BPF/cgroup firewalling.
[    9.206528] systemd[1]: (This warning is only shown for the first unit u=
sing IP firewalling.)
[    9.212045] usb 2-4: new high-speed USB device number 2 using xhci_hcd
[    9.213036] usb 1-3: new full-speed USB device number 2 using xhci_hcd
[    9.221050] systemd[1]: Starting iSCSI UserSpace I/O driver...
[    9.223998] systemd[1]: Condition check resulted in Create list of stati=
c device nodes for the current kernel being skipped.
[    9.226468] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
[    9.230197] systemd[1]: Starting Journal Service...
[    9.233522] systemd[1]: Starting Load Kernel Modules...
[    9.237299] systemd[1]: Starting Create Static Device Nodes in /dev...
[    9.244409] systemd[1]: Starting Setup Virtual Console...
[    9.252299] systemd[1]: Started iSCSI UserSpace I/O driver.
[    9.264730] systemd[1]: systemd-modules-load.service: Main process exite=
d, code=3Dexited, status=3D1/FAILURE
[    9.266538] systemd[1]: systemd-modules-load.service: Failed with result=
 'exit-code'.
[    9.267928] systemd[1]: Failed to start Load Kernel Modules.
[    9.271807] systemd[1]: Finished Create Static Device Nodes in /dev.
[    9.287414] systemd[1]: Starting Apply Kernel Variables...
[    9.298899] systemd[1]: Started Journal Service.
[    9.314042] usb usb3-port2: config error
[    9.373381] usb 1-3: New USB device found, idVendor=3D8087, idProduct=3D=
0029, bcdDevice=3D 0.01
[    9.374396] usb 1-3: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    9.399966] usb 2-4: New USB device found, idVendor=3D0408, idProduct=3D=
5343, bcdDevice=3D 0.11
[    9.400827] usb 2-4: New USB device strings: Mfr=3D3, Product=3D1, Seria=
lNumber=3D2
[    9.401626] usb 2-4: Product: HP HD Camera
[    9.402355] usb 2-4: Manufacturer: Quanta
[    9.403062] usb 2-4: SerialNumber: 0x0001
[    9.499024] usb 1-4: new full-speed USB device number 3 using xhci_hcd
[    9.652379] usb 1-4: New USB device found, idVendor=3D06cb, idProduct=3D=
00d8, bcdDevice=3D 0.00
[    9.653759] usb 1-4: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D1
[    9.654594] usb 1-4: SerialNumber: 39a4b3fb3646
[    9.969543] udevadm (719) used greatest stack depth: 13136 bytes left
[   10.044650] r8169 0000:01:00.0 enp1s0: renamed from eth0
[   13.378300] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   13.385736] usb usb3-port2: config error
[   17.442293] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   17.447554] usb usb3-port2: config error
[   17.500077] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D1=
 'systemd'
[   17.515978] systemd-gpt-auto-generator[795]: EFI loader partition unknow=
n, exiting.
[   17.517815] systemd-gpt-auto-generator[795]: (The boot loader did not se=
t EFI variable LoaderDevicePartUUID.)
[   17.613208] Generic FE-GE Realtek PHY r8169-0-100:00: attached PHY drive=
r (mii_bus:phy_addr=3Dr8169-0-100:00, irq=3DMAC)
[   17.789514] r8169 0000:01:00.0 enp1s0: Link is Down
[   20.630630] r8169 0000:01:00.0 enp1s0: Link is Up - 1Gbps/Full - flow co=
ntrol off
[   20.632275] IPv6: ADDRCONF(NETDEV_CHANGE): enp1s0: link becomes ready
[   21.506302] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   21.513689] usb usb3-port2: config error
[   22.972247] NetworkManager (854) used greatest stack depth: 12384 bytes =
left
[   25.570090] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   25.575551] usb usb3-port2: config error
[   29.626089] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   29.627594] usb usb3-port2: config error
[   33.682090] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   33.683582] usb usb3-port2: config error
[   34.515074] usb usb3-port2: config error
[   38.570092] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   38.571567] usb usb3-port2: config error
[   42.626126] usb usb3-port2: config error
[   42.774061] usb usb3-port2: config error
[   46.826477] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   46.828022] usb usb3-port2: config error
[   47.621064] usb usb3-port2: config error
[   48.421062] usb usb3-port2: config error
[   49.289077] usb usb3-port2: config error
[   50.085062] usb usb3-port2: config error
[   51.067081] usb usb3-port2: config error
[   55.122109] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   55.123587] usb usb3-port2: config error
[   59.178122] usb usb3-port2: config error
[   59.364078] usb usb3-port2: config error
[   63.418091] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   63.419360] usb usb3-port2: config error
[   67.474105] usb usb3-port2: config error
[   67.660065] usb usb3-port2: config error
[   69.458043] snd_hda_intel 0000:04:00.6: Cannot probe codecs, giving up
[   71.714090] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   71.715474] usb usb3-port2: config error
[   75.770103] usb usb3-port2: config error
[   75.956064] usb usb3-port2: config error
[   76.365531] loop0: detected capacity change from 0 to 1223768
[   76.393195] loop1: detected capacity change from 0 to 8388608
[   76.413242] loop2: detected capacity change from 0 to 67108864
[   77.618482] systemd-gpt-auto-generator[1137]: EFI loader partition unkno=
wn, exiting.
[   77.619942] systemd-gpt-auto-generator[1137]: (The boot loader did not s=
et EFI variable LoaderDevicePartUUID.)
[   77.709487] EXT4-fs (dm-0): mounted filesystem 850798a0-cff3-4361-a420-4=
f66b817b5d4 with ordered data mode. Quota mode: none.
[   78.404649] systemd-journald[159]: Received SIGTERM from PID 1 (systemd).
[   79.162695] SELinux:  Permission watch in class filesystem not defined i=
n policy.
[   79.163553] SELinux:  Permission watch in class file not defined in poli=
cy.
[   79.164066] SELinux:  Permission watch_mount in class file not defined i=
n policy.
[   79.164554] SELinux:  Permission watch_sb in class file not defined in p=
olicy.
[   79.165018] SELinux:  Permission watch_with_perm in class file not defin=
ed in policy.
[   79.165483] SELinux:  Permission watch_reads in class file not defined i=
n policy.
[   79.165946] SELinux:  Permission watch in class dir not defined in polic=
y.
[   79.166415] SELinux:  Permission watch_mount in class dir not defined in=
 policy.
[   79.166882] SELinux:  Permission watch_sb in class dir not defined in po=
licy.
[   79.167327] SELinux:  Permission watch_with_perm in class dir not define=
d in policy.
[   79.167751] SELinux:  Permission watch_reads in class dir not defined in=
 policy.
[   79.168183] SELinux:  Permission watch in class lnk_file not defined in =
policy.
[   79.168598] SELinux:  Permission watch_mount in class lnk_file not defin=
ed in policy.
[   79.169003] SELinux:  Permission watch_sb in class lnk_file not defined =
in policy.
[   79.169392] SELinux:  Permission watch_with_perm in class lnk_file not d=
efined in policy.
[   79.169787] SELinux:  Permission watch_reads in class lnk_file not defin=
ed in policy.
[   79.170180] SELinux:  Permission watch in class chr_file not defined in =
policy.
[   79.170550] SELinux:  Permission watch_mount in class chr_file not defin=
ed in policy.
[   79.170901] SELinux:  Permission watch_sb in class chr_file not defined =
in policy.
[   79.171262] SELinux:  Permission watch_with_perm in class chr_file not d=
efined in policy.
[   79.171617] SELinux:  Permission watch_reads in class chr_file not defin=
ed in policy.
[   79.171974] SELinux:  Permission watch in class blk_file not defined in =
policy.
[   79.172337] SELinux:  Permission watch_mount in class blk_file not defin=
ed in policy.
[   79.172705] SELinux:  Permission watch_sb in class blk_file not defined =
in policy.
[   79.173078] SELinux:  Permission watch_with_perm in class blk_file not d=
efined in policy.
[   79.173450] SELinux:  Permission watch_reads in class blk_file not defin=
ed in policy.
[   79.173822] SELinux:  Permission watch in class sock_file not defined in=
 policy.
[   79.174198] SELinux:  Permission watch_mount in class sock_file not defi=
ned in policy.
[   79.174578] SELinux:  Permission watch_sb in class sock_file not defined=
 in policy.
[   79.174937] SELinux:  Permission watch_with_perm in class sock_file not =
defined in policy.
[   79.175286] SELinux:  Permission watch_reads in class sock_file not defi=
ned in policy.
[   79.175622] SELinux:  Permission watch in class fifo_file not defined in=
 policy.
[   79.175940] SELinux:  Permission watch_mount in class fifo_file not defi=
ned in policy.
[   79.176266] SELinux:  Permission watch_sb in class fifo_file not defined=
 in policy.
[   79.176572] SELinux:  Permission watch_with_perm in class fifo_file not =
defined in policy.
[   79.176864] SELinux:  Permission watch_reads in class fifo_file not defi=
ned in policy.
[   79.177188] SELinux:  Permission perfmon in class capability2 not define=
d in policy.
[   79.177483] SELinux:  Permission bpf in class capability2 not defined in=
 policy.
[   79.177779] SELinux:  Permission checkpoint_restore in class capability2=
 not defined in policy.
[   79.178083] SELinux:  Permission perfmon in class cap2_userns not define=
d in policy.
[   79.178381] SELinux:  Permission bpf in class cap2_userns not defined in=
 policy.
[   79.178686] SELinux:  Permission checkpoint_restore in class cap2_userns=
 not defined in policy.
[   79.179009] SELinux:  Class mctp_socket not defined in policy.
[   79.179323] SELinux:  Class perf_event not defined in policy.
[   79.179631] SELinux:  Class anon_inode not defined in policy.
[   79.179935] SELinux:  Class io_uring not defined in policy.
[   79.180242] SELinux:  Class user_namespace not defined in policy.
[   79.180547] SELinux: the above unknown classes and permissions will be a=
llowed
[   79.184195] SELinux:  policy capability network_peer_controls=3D1
[   79.185371] SELinux:  policy capability open_perms=3D1
[   79.186463] SELinux:  policy capability extended_socket_class=3D1
[   79.186891] SELinux:  policy capability always_check_network=3D0
[   79.187660] SELinux:  policy capability cgroup_seclabel=3D1
[   79.188610] SELinux:  policy capability nnp_nosuid_transition=3D1
[   79.189563] SELinux:  policy capability genfs_seclabel_symlinks=3D0
[   79.190114] SELinux:  policy capability ioctl_skip_cloexec=3D0
[   79.217786] systemd[1]: Successfully loaded SELinux policy in 224.562ms.
[   79.291092] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 20.424ms.
[   79.300590] systemd[1]: systemd v245.9-1.fc32 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[   79.305432] systemd[1]: Detected architecture x86-64.
[   79.346796] systemd-gpt-auto-generator[1293]: EFI loader partition unkno=
wn, exiting.
[   79.348539] systemd-gpt-auto-generator[1293]: (The boot loader did not s=
et EFI variable LoaderDevicePartUUID.)
[   79.785863] systemd[1]: initrd-switch-root.service: Succeeded.
[   79.789700] systemd[1]: Stopped Switch Root.
[   79.791961] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 1.
[   79.792243] systemd[1]: Created slice system-modprobe.slice.
[   79.794932] systemd[1]: Condition check resulted in Dispatch Password Re=
quests to Console Directory Watch being skipped.
[   79.795813] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[   79.797513] systemd[1]: Stopped target Switch Root.
[   79.798997] systemd[1]: Stopped target Initrd File Systems.
[   79.800649] systemd[1]: Stopped target Initrd Root File System.
[   79.802045] systemd[1]: Reached target Swap.
[   79.804552] systemd[1]: Listening on LVM2 poll daemon socket.
[   79.807099] systemd[1]: Listening on udev Control Socket.
[   79.808596] systemd[1]: Listening on udev Kernel Socket.
[   79.826446] systemd[1]: Mounting Huge Pages File System...
[   79.828863] systemd[1]: Mounting POSIX Message Queue File System...
[   79.830215] systemd[1]: Mounting Arbitrary Executable File Formats File =
System...
[   79.832619] systemd[1]: Mounting Kernel Debug File System...
[   79.835324] systemd[1]: Mounting Kernel Trace File System...
[   79.838724] systemd[1]: Mounting Temporary Directory (/tmp)...
[   79.840262] systemd[1]: Condition check resulted in Create list of stati=
c device nodes for the current kernel being skipped.
[   79.842318] systemd[1]: Condition check resulted in Load legacy module c=
onfiguration being skipped.
[   79.842369] systemd[1]: Condition check resulted in Load Kernel Module c=
onfigfs being skipped.
[   79.843717] systemd[1]: Mounting Kernel Configuration File System...
[   79.847506] systemd[1]: Starting Load Kernel Module fuse...
[   79.849590] systemd[1]: Condition check resulted in Read and set NIS dom=
ainname from /etc/sysconfig/network being skipped.
[   79.851105] systemd[1]: plymouth-switch-root.service: Succeeded.
[   79.851341] systemd[1]: Stopped Plymouth switch root service.
[   79.853481] systemd[1]: Stopped Journal Service.
[   79.856989] systemd[1]: Starting Journal Service...
[   79.861942] systemd[1]: Starting Load Kernel Modules...
[   79.864323] systemd[1]: Starting Remount Root and Kernel File Systems...
[   79.866973] systemd[1]: Starting Repartition Root Disk...
[   79.869669] systemd[1]: Starting Wait Until Kernel Time Synchronized...
[   79.872181] systemd[1]: Starting udev Coldplug all Devices...
[   79.875199] systemd[1]: sysroot-var-lib-nfs-rpc_pipefs.mount: Succeeded.
[   79.875430] systemd[1]: sysroot.mount: Succeeded.
[   79.875875] systemd[1]: Mounted Huge Pages File System.
[   79.879606] systemd[1]: Mounted POSIX Message Queue File System.
[   79.880982] systemd[1]: Mounted Arbitrary Executable File Formats File S=
ystem.
[   79.883408] systemd[1]: Mounted Kernel Debug File System.
[   79.885004] systemd[1]: Mounted Kernel Trace File System.
[   79.887428] systemd[1]: Mounted Temporary Directory (/tmp).
[   79.891162] systemd[1]: Mounted Kernel Configuration File System.
[   79.893733] systemd[1]: modprobe@fuse.service: Succeeded.
[   79.893904] systemd[1]: Finished Load Kernel Module fuse.
[   79.897501] systemd[1]: systemd-modules-load.service: Main process exite=
d, code=3Dexited, status=3D1/FAILURE
[   79.897571] systemd[1]: systemd-modules-load.service: Failed with result=
 'exit-code'.
[   79.897696] systemd[1]: Failed to start Load Kernel Modules.
[   79.902751] systemd[1]: Finished Remount Root and Kernel File Systems.
[   79.905704] systemd[1]: sys-fs-fuse-connections.mount: Failed to check d=
irectory /sys/fs/fuse/connections: No such file or directory
[   79.914188] systemd[1]: Mounting FUSE Control File System...
[   79.917210] systemd[1]: Condition check resulted in OSTree Remount OS/ B=
ind Mounts being skipped.
[   79.918500] systemd[1]: Condition check resulted in Set Up Additional Bi=
nary Formats being skipped.
[   79.920492] systemd[1]: Condition check resulted in First Boot Wizard be=
ing skipped.
[   79.922684] systemd[1]: Starting Rebuild Hardware Database...
[   79.925427] systemd[1]: Starting Load/Save Random Seed...
[   79.928976] systemd[1]: Starting Apply Kernel Variables...
[   79.931504] systemd[1]: Starting Create System Users...
[   79.933684] systemd[1]: Started Journal Service.
[   79.964076] systemd-journald[1318]: Received client request to flush run=
time journal.
[   80.012361] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   80.012373] usb usb3-port2: config error
[   84.066340] usb usb3-port2: config error
[   88.258311] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[   88.258342] usb usb3-port2: config error
[   89.053290] usb usb3-port2: config error
[   89.883063] usb usb3-port2: config error
[   90.715315] usb usb3-port2: config error
[   90.812234] systemd-gpt-auto-generator[1469]: EFI loader partition unkno=
wn, exiting.
[   90.812244] systemd-gpt-auto-generator[1469]: (The boot loader did not s=
et EFI variable LoaderDevicePartUUID.)
[   91.547043] usb usb3-port2: config error
[   92.533044] usb usb3-port2: config error
[   96.586315] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
=2E..
[  370.042302] usb usb3-port2: Cannot enable. Maybe the USB cable is bad?
[  370.042333] usb usb3-port2: config error
[  370.837429] usb usb3-port2: config error
[  371.667309] usb usb3-port2: config error
[  372.499309] usb usb3-port2: config error
[  373.331309] usb usb3-port2: config error
[  374.315309] usb usb3-port2: config error
[  375.003453] xhci_hcd 0000:04:00.3: DbC connected
[  375.459336] xhci_hcd 0000:04:00.3: DbC configured


--6FO3y47iLORSD1yX--

--E5NehRBkKPFEKgZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQjqtwACgkQ24/THMrX
1ywoqwf8C3owpRw0BXN21SgW8BxiXWauZNfLQcGFHe+n/+gyC8o4V6l0SEC9+9p+
bIU20KIFBW/LHsBgMScFxm798h+mEtP2zJXpWHx9tkttJbQnO7VD7h4XrPJqfOLI
/zOa2SSnALqRCENoPgayrfmdLjWgT2Qy3Nraon/Ef+Mzvsywt7+79fg65NOW+IJa
bLhzS/G0zjzGEPruP7skzSVvtRhNrYIpwHoiKvID3+kQs0hzEkAPzXWV1y84pB5R
ccu/tCarfCks9Yv9Vd8RzFmuc6lA5aRBkyL6wOrr2yE/70FnhI0ajwGUHF1xeWdn
IjxBHGX2FICy3tKRzROwt4cVHv3CcQ==
=znjA
-----END PGP SIGNATURE-----

--E5NehRBkKPFEKgZg--
