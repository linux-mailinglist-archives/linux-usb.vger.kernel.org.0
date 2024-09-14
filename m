Return-Path: <linux-usb+bounces-15120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F49793CB
	for <lists+linux-usb@lfdr.de>; Sun, 15 Sep 2024 01:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CDEDB225D3
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 23:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C676146590;
	Sat, 14 Sep 2024 23:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b="Ji3HzvkA"
X-Original-To: linux-usb@vger.kernel.org
Received: from sonic313-20.consmr.mail.sg3.yahoo.com (sonic313-20.consmr.mail.sg3.yahoo.com [106.10.240.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2571754B
	for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 23:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726356514; cv=none; b=kIYPMiiu5Px09d6OULDdMKuzWUFd/oMIUgLqvahytchlbtLtJInYOwPxRH2Qx8/+zyU0D7LHtxJZCsX8/k48Nkpiide5OVqpsJkc5rnL60O+dMt+CoxC91brsNiraT608Z8x8V6SSLBzeZHjX8FPjiHD+CUX4AKTpbN3EMeR8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726356514; c=relaxed/simple;
	bh=Emd4abe0oHfdm5VW4aDX6LLoJgAcXCzLVCOLXZmKLAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=fICBW97lVJtRtO9DoeErV1Hxc6uHyYWqWnTXfoQ181v7SbewsPGqORep1hTObez5fBDCta5RsbPlqPNkRmtAanbr4BacfZ7LlqcjC2Il2Uh6B/0GV0J1jTUqoxWKmikg89h1IiWX2TSJl483LRTa2ohG2WXmlzh36+PrlRwckLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com; spf=pass smtp.mailfrom=myyahoo.com; dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b=Ji3HzvkA; arc=none smtp.client-ip=106.10.240.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myyahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myyahoo.com; s=s2048; t=1726356503; bh=TqTHPitrrLhLwGL6rNyIpEVqge6ePj8pP14s373Eogc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Ji3HzvkAZpemkE7BeapDgDiKleMFAyl7grlF85/l8Tmo+HFpCUgItrm7MkFiO1hdF6/T6w+x6LGdNRcya4qLEdv7hkxZPGoMZKO2QDH6YS0Atr5CPuXmhlB2qU569xv59aX33L/eakl0AS7Sz7882Z5L80NYF/CGoqAdlLlahR6oaI2dlKUg2a9OGMwW8hBd5uES7urDTWQL7G3NH3m+QdSlIG5TSiKAHnUL1N/ERCnpGBOI+JvZCk2Sv8EK4cABa5u37I0f82vji+VqsfHVKZVi64qxJLLAbhETqE09Lw2DaWm3KlI+JsZPE3EpkWT2PhvV6DzMYoafBy/ArQHV9A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726356503; bh=47/RBK4F6FVYtdejh6kk5hKTUteXDjVCScPBdJDpDQO=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=QBZAYG3KJCr69wz6zvwqcgrsJ9V9Qg16tnSqBhIKr9EDT6rexDrOAj3v0gIDAak62TDYHf5YmgkZGpx8wkOB4VEMxjEtyDi3Bhu5HtADrDWKiyT5JMhf2nThQc5ItYoIvwlRdySCBUy2+xoNSknfk07Qt4D9R5B7sMnk4DBbJ2Pc4ob220omMFHKMmTsyjhrt6/1TS8mvtWov3XWzjH/t/jikpwvDP2xLpAW0oY+ZgKiwr3vi0XdDzVd6Mu6iX7NZSzJLCA87Mc8dbeAF6vkZ5cvVsI44jHvVJGRY3qver1bToLMTgiEqC5+7vqK6yNDm/4/k4sNRZnA3l+FU3PA5w==
X-YMail-OSG: v8E_RlgVM1lcltomIYYRG8UX3jaI069jZo7QukGaA1oGoRncwEG0bMAJGHs40yS
 Y_vXdi5C3b5pC4P5sPnWcPLzea5QM4MLrD9rTlQUUeOyC5wmi7soh_LnVOhL.R.lgNYkliKrx5fm
 Ux2fmg23JEBddWRdWucbj4uEsD9vNs.vHJZGJ9z3sCLnM1awEVr.lDHeYN8Ket.3JoE13ob2wKAI
 HTIZTau3DSa8t673uPZ6EObr5fLuvJ6IfwLX3cbc2kf81lw6cQV846WPMjaTsQEHYIKieNNfdA3W
 Jn0hWH_eGpOFg8.cjn7ubRzZNlgNtK83bdv3Zh7pJdYGtBnoglMt9AS2xjZgdq0QSJ.TwB8jVUR9
 I6GR6YYQ5k41H5f1P6bUvPRCX_wfzLJp7NEF0p8vNn2xOPfnauln5MB83xzvC4C_ZdGjVl8uYzxW
 ZWzETP7WX_nqorgoZjg5nF1NHA3lQDjSZg4RDhS.F69gBr3Nq2.0_Gk6ViN2L1AqJIt3lKYhXBTl
 jq0vUyQ5eYsFA4LVeKUM7njPYs98VHJGqVRKSgjebHM47FEYYWekA3z6ixKfwkUZX28GU.5d.hsg
 mXsGpICVnlbJm4uD9NwD3DS13lQ6ooeE6ui3oUS9HxCbbwk2kIaZvW.4jJRVmM435WRfoSbxpMkh
 2Pni2ZimcRqootot594NFKkyILjUSY7dApoq7qlc527xB8d5buu4tnxIEH5Ekv6TkeQL2QyhIfOy
 4sArp70FRPN2YAEDLm.GM0QnZJbL4eUGplGpFe_0kczRNDY3hB8xWNG2pyorhKjy3GO0MDUs0YCJ
 mO_daSMZOfkaYVftFx4D8ynDwNY66mBXY__F5Tr._WJo2XBdQU.vnuxPwujD88Asy4NnKx1Yapgq
 FUpS2zZIRfKcOMybte.3v8Nrhokr3OMV_CAR6ATKDZTcC3ocu6AN_8thhrJmiyRqxLutFDpZrgaF
 kvku0.qQt65bg61JuXjMuinOgGpmo6VkMfHW4ohBxcQHAIxyFLymGOr2uNdqENKzt2J8gk8P_6Is
 VSyp0auVChjzCQrGlBPtbLESexjg7.ct0y0rFsRpvn.TOeIF0jsi3hmHnG_UxDTDRKC17YT.GhUT
 a8hJKdVtCAOFI0CEEiAjiOpFYpAy.7bW8DYPmBxiWmeMgY5n7ETaPJ1ShADsw9u74Dy5KxMPfvVc
 r0.6QqGqbklI2EyGrdtSa8NwCJq9yC_AsXhCRgfIOZ0.0staMdWg3R5noTX4bEvUjHd78tU5hcKJ
 9li8QaUquW_eQt0UYlx_ThS811L.RdTE_dJ_YfpsstKIyBWfxZzIlyW3REBzxz_X1ELzVZdZccdl
 Qn7X7FuEC3bBcmyq4YiAoStITwUX_TL5B3tPqVlx3Q92wmufqBluCub8yOWu2dfjqV96zkDMdBei
 pOkUPvdMd20AUsuVrhgpVSJWjix9ltlZl0yXJnFGC1i7GJWtk9FnKlbxaMfZ96QmE_bwsaXIYttQ
 V5.KSfK7l122.72ZAUkb7enmRW8l2mc8o1aLpYkhi49VgumCE8VyeIp7uW6atC3TyAr2BneTec8W
 M8GnZi_GLh_4EfDgOBGOk2HbAmjutnDS2vFPWtyXP_OoSOJrItXuM.Afk.ZPi4p9dVo7sa2.lNjE
 Yavy2KfYBglhbMEdYuYYsCg6dtpjhPO8h2JouXXy_.Fm8bSvcrEZmIDRpZxNsJZyxijAg13qvs2Q
 M.s2JRXe8SNZlt5xhPPWLcSO_aC06QEcXUOrZaWpoGV9jMVzcNvx3eYESOaZl1KXcKQ8mA33Hl.J
 One4iyFlRlY8TxL2HiH.ptKI4n20dyLTUeKVA2WGANslEjzSPRO9jTwGnqHdEsimIiRQxjtBqOgs
 Z8crJTjxYk9d0dBfMe2RdfX5BjKQvoo49wwTX7Fjaf8FZzG9s7OY5fdCetYTfE9mp4kf9VmbdnUz
 4UkJSDSXkAqQespckgo6pXL592qmLxSi_hkj3OqoTMo7Wq0a_HGGoAyHjo.G80hhqEyoDInIsM5n
 .yA0QueMVzz6hiki4HCzqnMmeu4WlWY0PZa0DlzFzG0qdEMmbe_J6BtSBqQnt9ALgFfrUikFMo6f
 IzHnn0qqN0kszmQJHCNWIumMpMJjURZD0UHYXxJfZPpdsMBK7_rHQgkz79paFyWnQ.sdhZ7I9k60
 skXBsLj.rgJVp8p1VQRWNtJPz3svWJIvnk9j3ZlzGSLRRjcRu9p2pgpz.HYKlDA3IPOU6_indO9e
 VyMeaNVeN2VO9iSRG0Lv44lTdbe0Pmy_x92.Xb44PIGnax89jvSdTtHWA_8ku43V8
X-Sonic-MF: <abdul.rahim@myyahoo.com>
X-Sonic-ID: 8e4f8196-d385-481c-9291-452c447b5336
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Sat, 14 Sep 2024 23:28:23 +0000
Received: by hermes--production-sg3-fc85cddf6-6lk5x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 02ee57d89096c2bea0084e4f53d4e48c;
          Sat, 14 Sep 2024 23:18:12 +0000 (UTC)
From: Abdul Rahim <abdul.rahim@myyahoo.com>
To: gregkh@linuxfoundation.org,
	kees@kernel.org,
	m.grzeschik@pengutronix.de,
	quic_jjohnson@quicinc.com,
	gustavoars@kernel.org
Cc: Abdul Rahim <abdul.rahim@myyahoo.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_midi: prefer strscpy() over strcpy()
Date: Sun, 15 Sep 2024 04:47:49 +0530
Message-ID: <20240914231756.503521-1-abdul.rahim@myyahoo.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240914231756.503521-1-abdul.rahim.ref@myyahoo.com>

The function strcpy() is depreciated and potentially unsafe. It performs
no bounds checking on the destination buffer. This could result in
linear overflows beyond the end of the buffer, leading to all kinds of
misbehaviors. The safe replacement is strscpy() [1].

this fixes checkpatch warning:
    WARNING: Prefer strscpy over strcpy

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
---
 drivers/usb/gadget/function/f_midi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 1067847cc079..837fcdfa3840 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -819,9 +819,9 @@ static int f_midi_register_card(struct f_midi *midi)
 		goto fail;
 	}
 
-	strcpy(card->driver, f_midi_longname);
-	strcpy(card->longname, f_midi_longname);
-	strcpy(card->shortname, f_midi_shortname);
+	strscpy(card->driver, f_midi_longname);
+	strscpy(card->longname, f_midi_longname);
+	strscpy(card->shortname, f_midi_shortname);
 
 	/* Set up rawmidi */
 	snd_component_add(card, "MIDI");
@@ -833,7 +833,7 @@ static int f_midi_register_card(struct f_midi *midi)
 	}
 	midi->rmidi = rmidi;
 	midi->in_last_port = 0;
-	strcpy(rmidi->name, card->shortname);
+	strscpy(rmidi->name, card->shortname);
 	rmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
 			    SNDRV_RAWMIDI_INFO_INPUT |
 			    SNDRV_RAWMIDI_INFO_DUPLEX;
-- 
2.46.0


