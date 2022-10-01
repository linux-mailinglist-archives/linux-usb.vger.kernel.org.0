Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8995F2043
	for <lists+linux-usb@lfdr.de>; Sun,  2 Oct 2022 00:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiJAWNV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Oct 2022 18:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiJAWNU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Oct 2022 18:13:20 -0400
X-Greylist: delayed 151 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 01 Oct 2022 15:13:16 PDT
Received: from resqmta-a1p-077720.sys.comcast.net (resqmta-a1p-077720.sys.comcast.net [IPv6:2001:558:fd01:2bb4::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1080A5BC0D
        for <linux-usb@vger.kernel.org>; Sat,  1 Oct 2022 15:13:15 -0700 (PDT)
Received: from resomta-a1p-077050.sys.comcast.net ([96.103.145.228])
        by resqmta-a1p-077720.sys.comcast.net with ESMTP
        id ekUdo7vkiiDwGekh1oF8BF; Sat, 01 Oct 2022 22:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20211018a; t=1664662243;
        bh=qitxeJai/0oKwAT5WjsZgCU6W5xVlMSZp6Jn4FfIDN4=;
        h=Received:Received:Received:Date:From:To:Subject:Message-ID:
         MIME-Version:Content-Type;
        b=OFSYZ/ifDdwcwD24ECMXFhPKhg7Mc563sL9cixzw5UqIVkLjqwcAzl7OejDkyK8ui
         tUNY5ry+T/CFwEHPCgHR3anmXhRFlZe1PGKcJG9SvNfX9w6azB0Ldfj5PXVdEbxxcL
         pjUIWP0kjD0Q0aVopBmMvoA5bGL7ZpzSSXn3QmxIdSLdE83evMuizuaxOyEDawgryN
         vQUJ++uOgVuEiZCMsXu+NrTQ9XDC2D1s70pGMaxGZ4RskrFXi7Ny0lG0lD9t7ZdoZe
         1WaSG4CB2HJp+dVHGF5/wzY4k/Jbmfv14/3kZHHkyaC82XdYELi/FxhXjUGd3iPfoT
         JksnSjV/72srw==
Received: from Outgoing.brak ([69.249.67.241])
        by resomta-a1p-077050.sys.comcast.net with ESMTPSA
        id ekgdoJCGsiaR9ekgeowl1o; Sat, 01 Oct 2022 22:10:21 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehiedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhrohhmpefrrghulhcuffhinhhoucflohhnvghsuceophgruhhlsehsphgrtggvfhhrvggrkhdukedrgiihiieqnecuggftrfgrthhtvghrnhepvdfgfefhveejleevjeevueettdfgjeeggedtkeekvdejudeljeejhfduieehledunecukfhppeeiledrvdegledrieejrddvgedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepqfhuthhgohhinhhgrdgsrhgrkhdpihhnvghtpeeiledrvdegledrieejrddvgedupdhmrghilhhfrhhomhepphgruhhlsehsphgrtggvfhhrvggrkhdukedrgiihiidpnhgspghrtghpthhtohephedprhgtphhtthhopegrnhhsshhirdhhrghnnhhulhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorh
 hg
X-Xfinity-VMeta: sc=70.00;st=legit
Received: from localhost.localdomain (Linksys01880.brak [172.18.18.227])
        by Outgoing.brak (Postfix) with ESMTPSA id A2B59B31E8C0;
        Sat,  1 Oct 2022 22:10:19 +0000 (UTC)
Date:   Sat, 1 Oct 2022 22:16:57 +0000
From:   Paul Dino Jones <paul@spacefreak18.xyz>
To:     jikos@kernel.org, anssi.hannula@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] usbhid: Interpret 0 length ff effects as infinite (0xffff)
 length effects
Message-ID: <20221001221657.gexisc2egjn3mpog@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Description: Set zero length ff effects to infinite 0xffff length
Content-Disposition: inline
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FROM_SUSPICIOUS_NTLD,FROM_SUSPICIOUS_NTLD_FP,SPF_HELO_PASS,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,

I started using my Accuforce V2 sim wheel on Linux. I was getting no
response from racing simulators through wine, while native linux test
tools worked properly. It appears that many real-world applications will
send 0 as the replay length, which was resulting in the behavior I was
observing (nothing). The PID document does not explicitly state that 0
length effects should be interpreted as infinite, but it does mention
null effects being infinite effects.

This patch will interpret 0 length force feedback effects as 0xffff
(infinite) length effects, leaving other values for replay length
unchanged.

Signed-off-by: Paul Dino Jones <paul@spacefreak18.xyz>
---
 drivers/hid/usbhid/hid-pidff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..70653451c860 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -301,7 +301,7 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length == 0 ? 0xffff : effect->replay.length;
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.35.1

