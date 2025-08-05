Return-Path: <linux-usb+bounces-26489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 025B8B1AFE8
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 09:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A675A3AD807
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 07:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EC821FF3F;
	Tue,  5 Aug 2025 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de header.b="gZ1F2o4i"
X-Original-To: linux-usb@vger.kernel.org
Received: from sonic.asd.mail.yahoo.com (sonic302-19.consmr.mail.ir2.yahoo.com [87.248.110.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4402904
	for <linux-usb@vger.kernel.org>; Tue,  5 Aug 2025 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754380671; cv=none; b=tAVUg4pkRt81THLgjIVbsP5qlYygrFJR+7DsJoWpCFJUZICYh4gQFIUeWV0K/Vq6hkOD/6vy4X9Q0d0aUVtcLJgn13ZhV6ld3XZPfks2D63HgdbPi9PZxWCNLX6pmUxiluIL7+l2p/ei/ZGH2F0rbdF/WNH+Dzml3iDJdY9DJ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754380671; c=relaxed/simple;
	bh=7WTcqVxpTzVAjFiIwAL7KxuiqkTgWBCIHjfDhKSC66U=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=UPDEKC2Sbbt3Mw7tMMGAm+P0XNqUo2fDZXqz1xc8kZ3TlYiM9dkLaGz2cu3nHT9/Xc2FW4Lmvj//YaNbA/jASD8PvmfkVOZ3kcW9H9MGFgRqLi3na40DCbp9wDyv4PNBN2b/uYFvdXCH7hJYHSX1Gjam235Q4J58J910/ZyTq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.de; spf=pass smtp.mailfrom=yahoo.de; dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de header.b=gZ1F2o4i; arc=none smtp.client-ip=87.248.110.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048; t=1754380667; bh=7WTcqVxpTzVAjFiIwAL7KxuiqkTgWBCIHjfDhKSC66U=; h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To; b=gZ1F2o4iVDGWTtojRBedYYn5vIOIb/J4+DYWAPrsY/99uB6uGR8OlF9EftWpew1BAFdARkbPuxlUjtgXk3P3+njwfyhM8xYUV0XD7zt9HQpw5tSxKqs6z1ygsMefZDx1bENkZX6K0PwVdd2LASw5TVyOqsQk2JBlxHJXd7TmIyAGXMsL7w/sNRAY8DQuOtT9Iql1LSXy97UYailrYSFv1ihEJKDLYRfgNWdBWkncKDtOfP38rbJiOaBFGTNgiWDDxDmp/Nrz+MJbDpzB4N2xSghLzXsx6y4feu++dQmGPo0YScRl6+NRIz0EIEXsQcdatbjrbzNlmEfUVw3MplxskQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754380667; bh=NnxkAVGtyHRpaQ/6kAeJqXEqZmXFJKSWVaC1zitLLYO=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=JduTJaCKQC/mqHO14R5Mud0h93BPFbOB7bO4/Sne3lyZkx3WZH6NNVH4SLblFoEIRvQPD/Wt1zXgTpxOa2VhAN+LBJNzVwPQusK0qSvNJRhslsopa1bSr4wEEVtRVdU4NzbXumGOi4+EmHpovdkL6ewo2YU8WsZdMRHoGiqmyV4K5PE+hgM2GiiB/lrdhq+RBZSYO6aXSsMOyf7paTdGywP1mtQG7nnPo60XBwyOxZKBD4Z5/DKMTIESDbFWGPNjPViYVZjdcUcjRvFuF2aVhwWraaT9aDTilM2UzWyA21m9cjUhbfLus9vda6UuJVTVhyFTAr51XW1cB6YBh5NulA==
X-YMail-OSG: DPOOY3YVM1nl5JkWGaYxpzmMEMqeAkv.8lw3hGiNa6T9jXtuKhdEtzavHPQVkcS
 TrLUBaluHjYccopyOvBJd.03bw8Jud05vwF1.yTsYGKbzZbo.HPUHEU89AJ1oDvAGk_etI.gzWU2
 MY3JoO.lUcx8pr5mHhnlrbVyDfUbmmpkOu.hpC_JZBOjN31bsrjJe7L_BzW.FJP2HzfglcIfuzyG
 6Fsl9W3.R9F6reZJiYmWXn1tpO75L6aucEFPMNFrSZLm3FSPmsBc7AFOcYQBEkTgjHziecKdBTyE
 cCXWksaDpm78TvYdUUMlhb.8TFg.CQ38MTRMa0ANgwl1lEmayoD6reUvU9JipA5IvPoJEF19oYrl
 HzSjltdLT9F2JQoZVRGEoIsCZJiYpLVRfTI6Y3n0pGgzncNhwcIH0yACSsywvRmEz_yTj9uMN3pA
 M6XmrzN9hE4FOMsku1VKV_gF2Tn0HNoi9gro8dIzkVuTkEDmffikhgOZX90Q2IGCV2N6SwrQhyvT
 egxPQAWDLQ6bNSiPe04vAdTc0lBxr4ERP6nG_7gBVuYZL8Euf6RFiUaJNqT3JvIWWKGQD_V8spyD
 flYTF.Yx2B5mMH4oBnfMLCnRT9V.fmNetEKpRARDNeFeYKdg7FT6y9pVtHpV_I3JesFyOWt9UCS5
 BLsospUIyK4kuK.UX5d6E2IHdXCYOLkh3cWY_aGTaje_2UzDuVyeTCKHkSAEECl6u.VNEkY0AmjA
 LpPPYX6IezcMhoT9mcJ.Pbdi5H.cRwIEtLelJpBYGXMHsNG9Ynqfg9iGuPuAbyw5YWUIC_PU9M2Z
 oc6xTQLRzXnzZPfW.t8aZDSWTgLpFpICqgng3fwrcr6WPFkBXBKdQQR54ID3xiv8FrQXhHJ1joWo
 HI_mC6i060x.8G1iKuzk_bkX_jZVH4IW0NjBff9n2maqsYAVWT7PqpSI8XaiBjQpFy74SodVTZsV
 7v0qE.lqVfIwU6NrvwrTX2t3VWg4gqc31lO2TbXPHry2SG4CEBi3YO0kunQWA8XrFjog_CMBhmET
 kc7EQIRhHDo6eOq6XxRHT8NS7IjbXRdqlAru2nC1M1wg5tI20CsYYD5bAOzCyiDYWf9Vh3yLuxQ2
 77KejJaytTOvzvVqmaskp6.RHbnS41FLziw2PtoEta9JDfiDGZwWloBVLISOS_pUY5DwUP9NlBKN
 EJTm1Tuz6HxvjLe12qy.SnvmM.V2f8pYqNOvxPH4hH.q7wo.O6JkkNYShIWHhXQt1TmFghi3xf5h
 wQynNZeiKZqoTecdnRAor_GRVHnjme1g348MCPnCxXJ7wtMX.Nn8eK_TCYuJgMp8OkDyuRxuQPjh
 Kq69XZhXDGnqIpkzfO75DrzuTfNvkeqpGdB_oX3wZpqRGYRcq8XVs_Dakui2E6vWag7eVNZre6CK
 r5qmahi9vl1AWhH1MSajrpgqbkfL9JwGVGUEa55N6Z.DP.qWyYn_hbplaAYF906GkbSAUc_xpyF2
 WTLu.f1ZK7GoSWZusITTMO7Uu3NMc99bX8PkC0YXqNBpeC9SzfekCdvysqvAJzb9u9MPDei_57UA
 p6AiH..SXy_GW53uQOOMbP4usMM1ZI09XTsMXsWkTpoXp6JQmsVcPwFWOsAES8p_obxaRmjAi58I
 piDnbN1uwee9okdlYabkInQesVxDMnbgYAuZOBCWHBWsra7_NrRm94OYdNiV0QPflsrY7VhTv1cv
 RBvZzSFHUXDX2TCj5Pqma66g7FAATXbTUNDQCsai35Z.r1.QOS4mInfWsl6YQf1oOBe.rJlCw30E
 QNTzvs.zLcqiPEujYkgVYzkJs2XZOclx9r5z1caKFUe3xv4spxwf75vcnb4gNdORSFmU7n4UUiaq
 cbcCfqjFj5tCD1SivyKRvMPieaHhc4hjSVMRjRu2N9C3EYRcOntebV_MadIKfZuiUJetwf6iM4q0
 PV0W6RpSr7jaGILK0spN.Pu05AEIk3_wgXplI.m3TFrgGX0JCN7YWYQawYaQqgnil_Fzh00iFVOK
 5Zjnzq27NAbzZ5OZQw9BL8_w01BhNCQbAL9A77x4ukcrd3Sk4EKldpWzdUCv9i84TTNFJ_sx3cWW
 _JyuquN0iGlQ1.E_5LQNcuf4n3Dk2Y8FHYq95FG2F4pBbDSHo.6nT0AmeNKSkfApSk8dMfXTjvUx
 CG8Cv6S8NKmbG8YKqKY8ijf9_w1Uye8qAzkTRrJXtDZlCCJNw5MaAQorHrLyliiTlMEEUJP1jTrd
 bkLfZu3DlWFO4DbpT1y7.uQmZh4A6h8sCxRYdA_c-
X-Sonic-MF: <ustoehlker@yahoo.de>
X-Sonic-ID: cc92cc42-ea4c-4733-b203-9be5cff8c960
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Tue, 5 Aug 2025 07:57:47 +0000
Date: Tue, 5 Aug 2025 07:07:03 +0000 (UTC)
From: Ulrich Stoehlker <ustoehlker@yahoo.de>
Reply-To: ustoehlker@yahoo.de
To: linux-usb@vger.kernel.org
Message-ID: <585146173.2802367.1754377623142@mail.yahoo.com>
Subject: pl2303 converter - unknown device type
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <585146173.2802367.1754377623142.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24260 YMailNodin

Dear all,

I have a Multi-Channel-Analyzer (MCA) interfaced via usb.
This device cannot be used on more recent kernels.
I get the following error message:

[663822.490455] usb 1-3: new high-speed USB device number 17 using xhci_hcd
[663822.616495] usb 1-3: New USB device found, idVendor=0557, idProduct=2008, bcdDevice= 0.01
[663822.616501] usb 1-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[663822.682309] usbcore: registered new interface driver usbserial_generic
[663822.682326] usbserial: USB Serial support registered for generic
[663822.686383] usbcore: registered new interface driver pl2303
[663822.686402] usbserial: USB Serial support registered for pl2303
[663822.686423] pl2303 1-3:1.0: pl2303 converter detected
[663822.686431] pl2303 1-3:1.0: unknown device type, please report to linux-usb@vger.kernel.org

Linux host1 6.8.0-64-generic #67~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Jun 24 15:19:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

But it works with older kernels:
Linux host2 5.10.103-v7+ #1529 SMP Tue Mar 8 12:21:37 GMT 2022 armv7l GNU/Linux

Would it be possible to correct this problem!?

Best regards

