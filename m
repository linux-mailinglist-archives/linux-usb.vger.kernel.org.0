Return-Path: <linux-usb+bounces-25896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01AB08163
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 02:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7AF1C241E4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 00:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEA72CCC8;
	Thu, 17 Jul 2025 00:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="CJnvI4bP"
X-Original-To: linux-usb@vger.kernel.org
Received: from sonic303-22.consmr.mail.sg3.yahoo.com (sonic303-22.consmr.mail.sg3.yahoo.com [106.10.242.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D640B1799F
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752712048; cv=none; b=EbNpi4GgSfLcUG+SbR1w3PojYdCGxTerqhL5z32N4p6Bb73/gOEvedz0WeHmtqdbvvvy/5OomNVsJ4V+CRUyrynLwe1sDIpqqT88T7GP9SMkLLvNkXforYQnhvALcL00R5h3HhobQhi/inp7vlAb1DV+w/9/cmo39SJXcjrfLUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752712048; c=relaxed/simple;
	bh=pAQ/IIhDfswg2fJKemCk+fJim9r6NrRhB5fn1uiOCGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb/rxgyZii3vpjt7W9S06X7aSpsQ5f472eTeF+IaDbLe4AOVbyLj/Foay3mKMNpcI1EG0evIJQwsYr6iPKExWjCHb5JUutuFVwhk2LQqzCUUSlm+rAJGunRXZqyIHVV11qQDBn7Ex23VCZ1NatvXD4fvyciKjDasJLBUTtlVSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=CJnvI4bP; arc=none smtp.client-ip=106.10.242.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752712044; bh=pAQ/IIhDfswg2fJKemCk+fJim9r6NrRhB5fn1uiOCGE=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=CJnvI4bPBpJMcg193/feudP2Xpf8soPGgW6b3LbeoCojDjMtvMksjQ5sbc4l/4TNhCxB3iB7cY3w1VV+sXrHVAF8OV+4tP+SgTXoF11nmmSjt7GRjuc+P0OLYoBA8OS9egxuHAgYvYio9ygIuyIstf/6c3ik+OPSkqpHBLkGt5NxphohFKO8s0rST2/SwxZGsKxCdZeT6RWgRFV8OtYZOwIcr0vcvnIOpHhM/gTLs+sxvL0kV3a6Ys0V6T+waah/+depoZj6+aS1ryvSi0Oc2+ffGrvnUa5VfZAY8a6qDS8ZmYf8B6SzMI3/X9/iGa96n/rMQkHctEbtsD7aHlQXQA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752712044; bh=Vsa5i9IyMt/9C8bLMIFJKtFMp6Enrsh83IbPUx3iY7d=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=hL2t+Ngnr47kOsdR2vY+04j0iS0vRjIxqXGGJ2G0SI1zoyr2VQ9A+OYEdurBfAyO5Sa/ljiFt40E4s6SKtC2pC1Zll7KDRiq/r1zQY84ZpQOCTJW/AyUIDaLCYrgicZQgE0rN3vHJxe/8kibKfndb/JWw7zQBEMdEOsQqjWoUTsoUW88QC1ATrtke1ZNgyA0DF7Ee9Za6MuywNe9HxKJK5w//m5iS04x0sitwecQX3DxjaFyRo7sRwcvdWtAvR7Y5cb5gtDlXdeGN5jz7Sn1ihITWr4ThZZtBKS38y2k+SuyIgzFdKHDr7n91ZN/IzslW7tBJdpek11tECjRLq/aDg==
X-YMail-OSG: Hhip8G4VM1mQsubJ37_3YVw0rKEcYtxZetwEoQnmEZrkRwQrHi04wINY_9zSVMO
 3cQJnAhlZe3TH8T5nsldrxA_.Achq7TNF2XvY5Ou8DJj0xoIVxv68wJDD8lIjjJ2nP60S8kruydH
 x7_jAh9JOXj1mjIbAVKULiFj8zkFnSJvE94s9vlNf5eubDLPwwsbgKvZLC.wBMXm.eX1QA_nShJJ
 K4_Ds83UgkKwPLyq5wcO7TXS_.TkBRdoF3h8Ouv9p3QFOzmZAkfvYkkblpPCtfqKVFieEaRD8yLq
 Il21zvxmQUGcjRWxFXQoGaGi4uvyuKdUJWUDTJ1z.BZ6Ebd0LP4_PoiY0EMbdmXBWrQtKuJmR7iM
 MRElajNZac6.tOmH7E2N5WipJU0z.X46pDc_8BHqhUWoPARyugr_iSaEsq9GtMfPyD3XGMrolCDR
 nT3fBKf4x1aCggjALxEFovfmuyo.Cm2lp4ZRYUdXGcL.R5HZzkro4rPdLNWvNmlO1yMuUUON3khr
 yc6EJ_bDfrOKUWTn2QJKl59eniyGBID2fSdjjg0Ut7lslpD1Gla8kGY3HW6TXllUABcYXmwyo2xG
 1ue13_toy8LWzzpgRLMN71hfMmzB17bHgddjjDDMWiO8zr2Ax9j1p_NWnJrB1JmT1Ep4zNz5Gmyv
 LFag5wISytnU9lU8yHIFtdQl8.rS6sjz4LRZ3njAGYQKfAk2ZwHR0EiqDGGRFcuYdV0ntIJnf8HY
 6Ene973eocCEBeduYlSD6bXh4lkZDb_GB_lnw0OjeB62M6EBa0zxUMLx16PC_eMMt7voTAXlsRzp
 eLxytKqYqPRUDEMrO7N.kjFecXify5Q9BSQRfZYGfZWJvdVPVTJiB5a5CAsoC24pUtG1uz7hVEA9
 y2oQtc2TAY5i2ScTXQxLiSVl_s8Iy6.eM9Tg03u9.UeoiVBJCRVfKEUUZWqGJcRHbYeFTYtFv2d0
 dv3xp4dQjPj6zuR0Qa2U11bf4p1GRclEV5L3KXZlRIylod44PmBwxzonU0iZG.Agc3ec73_YDUtQ
 xq2mQqLUce4jpK85..TsensMifSTG.j78IaDvHyzY5PSIAKvtmKJbuEFO6tjei7LXT.BOikIfs5A
 EFnUmLO.PytuoqYe1AbHYAeTF22JERtXoqoIhywra3zUZuuFgNvaqcr3DaermpmGhzlP4lAw9Al.
 3.yxUz4TMwEMeXG1iaTGcX7Fcm5fG2gZtxs.tPsbSmWXr3Vf1IO0WlQXynsFIsf16UCJ0vQlXRkl
 C04MyAqCw2IBjdh6IZQhC6y6ugXH0QDScozWjtrJkk_N1nTK1Kds2_PPbSQUjXr91ua34IkpKgp9
 zyIgC6Twz87LGVambezX5fIO1_ptPbqSNQwaBYHWWR4Mv1uiTAPuH.TOW.qAH6XQTsoesFKDE0xq
 oveCFuDeov0PHGroKEzDZiTeF.nApaxgf.QdxqtUWDqC8dxh6NR_VNPIa9NGARq_L6fsklCIoAJz
 wQ9Su696kTPaB6yHfsKho4I2hv1wLOdMb7kUXOUO8e2scS24sbLqEe9gVeZ59P3EgVc0ZoopcbCE
 UKe9mjNZnAm0_ZnMC3LfosVYE6nb98QSzTorKBr.5q4AQgC9_GZxZIjrugPWRW4eYGc.4Jf1zc9Z
 KcuJQ8qS2as.yJjqenT78orYh7VMFXiHvGzFxyNYkzqjq_v_OPIfHaL8d77DgTk89NzY4ZFO05c4
 H0uMCcDBwAvggIPNcxftr8PMoTr8UnSOn1GlM9g0DIZ2k2b_7HLs3eyWhXLnEjlDKfE1kUzv0b0k
 1J7.9kmV.ylvcfNk1gHCz6AO3PZhbPFO9XmW14dNu8k6sKLSDf0PRRiZ.qHAWYaHJMrTvIdOqTMx
 J5g5t11C3icnvLnZ1RWdbu_.RaE4Tl.GB.q8dnkX0Phv4quIAhtm2sbwsN_.5tPg8OzCOlNgC2lq
 VsylC3Mv.Vbx.NLgR__DJB.w_KDL5Oxh4Qs9sS5SM5TZLq3r4Q870Lue12On0pWvWr8AMMJ202fd
 ZMUxcaulWffQYdzkkgI60J9obBl9MxMhbnjUiDdg.nUOwXgk_fzrxQqY.cqWlIuLqbVoGkfMsun9
 fUoGH9gh2mxyMSKC0T4_UyjcavmgUqTWDNqPa2dXU.2qf.7HenedJL8LHpBmyfmDq2qTr9n4pbQG
 n0MvQbMiplDb3U.IIKhJraBMXvD0m1ReG7v5MsbDqn8j7_XyrWCbMAr5kfRBGT8jt8DhP8OarIPO
 C9Tw3AKSiAzxwN3BMu_BU_GS58v.KxAqVCnky3tgfX_CuLZ5wINezT1NTZ6FkV33ZhMC_a6qRyEC
 XRFW3W_XkBA--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: c5be0f29-6388-4676-a4a7-9050df7cf1fd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Thu, 17 Jul 2025 00:27:24 +0000
Received: by hermes--production-ne1-9495dc4d7-clxb5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0212c9e6b7505a9b54117a53d36bc6a7;
          Thu, 17 Jul 2025 00:17:10 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: sumanth.gavini@yahoo.com
Cc: Chris.Wulff@biamp.com,
	gregkh@linuxfoundation.org,
	jkeeping@inmusicbrands.com,
	kgroeneveld@lenbrook.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	quic_prashk@quicinc.com
Subject: [PATCH] usb: gadget: f_uac2: replace scnprintf() with sysfs_emit()
Date: Wed, 16 Jul 2025 19:17:07 -0500
Message-ID: <20250717001707.186867-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704003425.467299-1-sumanth.gavini@yahoo.com>
References: <20250704003425.467299-1-sumanth.gavini@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Just following up on my patch submitted with subject "[PATCH] usb: gadget: f_uac2: replace scnprintf() with sysfs_emit()".

Original message: https://lore.kernel.org/all/20250704003425.467299-1-sumanth.gavini@yahoo.com/

Would you have any feedback on this change? I'd be happy to address any comments or concerns.

Thank you for your time and consideration.

Regards,
Sumanth Gavini

