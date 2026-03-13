Return-Path: <linux-usb+bounces-34732-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLOfBDXWs2mzbgAAu9opvQ
	(envelope-from <linux-usb+bounces-34732-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 10:17:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A328053B
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 10:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B8D33002907
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742CB38C40D;
	Fri, 13 Mar 2026 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKT8jDE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdHbHVWF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46038BF7A
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393296; cv=pass; b=g3pMQMNg2w0P5FjOhakfihHZD656eaMOWCAfpulzOJ9KtuU9ZzVZ/PigDX8JKn3e2W3vCOTp0EWcmFhsB4TSQgp6Elfoxopwxujm5N44TaBRTzRakcLvOAK1BKdu6frw08SucE9Mofj4fNIvwOlMnhn50reASO7T53kVGVOA6P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393296; c=relaxed/simple;
	bh=BPjnI6vEyDa27C5SUaZ6CER6ErH76ateZMWc70oBLSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYwH1GZOiNV7NP2KI1fRPx1ag5VHx/Tt3nxTmajPs8Dd3PjUit3LNvc0VPxv5GyW2SMVbO88bHiFsNgBLWCzeyPeb/qJnc3o9wmiXqKMIWj6lwTeFvDoR2ggttkcoUe194RAGOIN/shKp8YdWsyr1uSNj5NU6/7+vKKedI0nYOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKT8jDE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdHbHVWF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5ta4c3229800
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 09:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZE/Cdn50hoBtmWMCHrKLcQgXkzCZb9mCkPvuhZPiXUQ=; b=kKT8jDE7cVuoQec8
	XzVhWoas5HGEXTJI41Wu2i8qKLyBCY5oO0HdArwaQiEhP97RkYme99lTvHSvsKnc
	v0B3MOp0N2RZMgthTsyR860duYCS3C/X7BIJhyJH1zkVs9ozjiW1FH2s0qUgi2OY
	7VA3MqqxsJt4hb3LWPo1kzops4sY9rRN6aUw5vBwkApsQ+djF3vQ+CFYQr2h+SVW
	CFva4mDMRMXKOMayZ1e3OjIxvtZHL9O5oI2r6nMK/85Fd1OGJGNKoSigvrWeV5Lj
	LdgTltL5AU+8RxqbrcVI9agU74qmnNKV6DeCCH/9v7g73DKf3Jp2wIw5XezdnmXD
	gDEdsg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hfpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 09:14:53 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7983f854288so45614507b3.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 02:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773393292; cv=none;
        d=google.com; s=arc-20240605;
        b=VhSJ4B2gW/FrFIa8J9nUivt7FHmywJbaYcBh54A5ENXEKyUmzlTVPJvdxr42kqUrsA
         YsD+CH91cRtlNxyKuzThUpMvy3GW1DCjxO4l0Bd77wS8kVQYYFSDO1llxWvVRNVSzZl2
         CDLjqpLIRRWvyZ3J0jgw7lh07+HXeVMsSAFS8fdtSkc1CGN1QCQk4YaqlFvGaAcF72+0
         /m5YnEDc7xqRPMAIizt5cCcQC1zN1MY69mYxwXQtj75D40Zfv7ruWLPHYOKnGBd+h8CE
         s4b3AAtBtNHSlWYyeVPNVkWLGmRwDm1duCLiMftbO1ToaIMsfMunj2hS213fR0nGWAQE
         jCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZE/Cdn50hoBtmWMCHrKLcQgXkzCZb9mCkPvuhZPiXUQ=;
        fh=2/2WcZAs7kS/dEljdURriuvUYQIv/kFWWU+u9rsDGaQ=;
        b=k12WH1ZsLbzg8mcvPRNEVpIMhrqcdhgzv2oQr/frar0n8u6cyrkSRKWZckY+jUIRAz
         ToQLS7QE8RbRNlHPE1Z/wRp9F8EgRw/6wePqE/NqhaKvpQ/u+mG6pmhwLWi6HX0YWkG4
         637jbRez2vmI2+CpOAa6tnmyPTxesGITorrCqQyga+HwhKjNMdeRYTrqeULUEfR2RVvZ
         zWjLXSq6cOBZXWHrGRkBFR//XZVWN+1d2xwTH/PS+zV3/dMh8w5hWQRG/sRY8R8Lewlj
         cmWMXFiEF07CKTVc+75b0CFMJpCUO8GrPSWQ9BtwREzgHcAbslH9ZiV+Z1DFPLOy85A7
         s0Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773393292; x=1773998092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE/Cdn50hoBtmWMCHrKLcQgXkzCZb9mCkPvuhZPiXUQ=;
        b=XdHbHVWFhbMMd70eSiy9fPl5JyKelaEEeORAPBmv5DvO+nTYPivu+NIh1ww8rbnH/k
         9V9kWmNsznUiOwL8nw5T+j+yrUwt2OIJnry2itTTYWYr0zEtafX3+7ClDoywJa0QmZOS
         PEloDAzLoxseAiRW2l91JveW5V2iHDisGhlGqAAvNYUIQkIEOWBq6jDIMDfBSPqgwE+r
         UDpphKXBBFQHxzyRszVNM9mzhPdzwFRnZ6nbi0ZB+EH4a0CDSjCQFChCvDKM2C7Lhyvr
         x/4ykWmAjQopbyeMSxRfZ1+qcTRrBPdfZv5jeT4SWvenQfG0Oqy/yI6z7q8VSnFy7mmv
         +iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773393292; x=1773998092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZE/Cdn50hoBtmWMCHrKLcQgXkzCZb9mCkPvuhZPiXUQ=;
        b=lpZZ+n6reC04qkgJj8T/XPpiLzvCGL32vAEliKcBJHg7WGGhOR/aq1Bs3FzoNxUtWJ
         PHo4Z+3yQoCrLcF3AHbEzCCso1nDV9ROA//xGNRCwDz19YC26+Sqkma/VmxEbM2aSjuI
         GBzIVmmV7bTEq32ekexfIZI/Q/kf+Sil7LRdcOJB4Uut/4BSmyZeY3V/C1SRtIpupqah
         jyWGgyGc32uCWShkgK919PNXEpm3YoH6cBtyDiq315PisX7PXI6YN+s8auXdnvBNfvj/
         dieRGzn11eymyue8E+CKQtk8WYahiWZo1k9nZUAYyQ784q7fotdRCmI+0LbbTn0rdJVb
         3X+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIi+f15kcLXwWgS561AjmwKPwS+q7wv1zs6r7yibaImda50eCjxzvMshyGaEDePXiYoy70RkEMENQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAddkt5bBalyZmsbIgGLUzFlje2FT3Mgiaj3lL81jnKden5yJe
	VXIqAI1EvJ2DR8hLBGskGtIG5jWqZLCqwQB/ICosOKItqW4ix6fR2zfT1pTWaAABN1G1SDcLJ3J
	7l09GRWrrwuSHWTBcFwapSARL7dfsU++CecZhBtDapUn5rAKbUWznK/khZclp1I0aT//eLur9Ms
	vK3AfWVAStEB61aCwykogbFXKz/J8G3H0DRf3ZHw==
X-Gm-Gg: ATEYQzywFIl37bTWpNy2HjOvmugc7yRjCFABD4ls2iaMIFchmiDnrO7PzvmiY5DRUdD
	M5oTBM5NON0LDBnYtLZRn+Y35mphZP1VOes74QRTxYLPlLoBlCTaLTAcostzrkboc7p6JAlRXH0
	GZ21Qrihy/Qf+SMMXpisdbRTAst7Urojsu4lOKi67PIb1teo+6UdHgbHYvKdPKq1NzSutsYGrP+
	u3NE/g=
X-Received: by 2002:a05:690c:e3e9:b0:798:67be:f8fa with SMTP id 00721157ae682-79a1c0e0f6amr26126757b3.17.1773393292280;
        Fri, 13 Mar 2026 02:14:52 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e9:b0:798:67be:f8fa with SMTP id
 00721157ae682-79a1c0e0f6amr26126517b3.17.1773393291892; Fri, 13 Mar 2026
 02:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312101431.2375709-1-krishna.kurapati@oss.qualcomm.com> <abPQodYcXFT2qxlq@kuha>
In-Reply-To: <abPQodYcXFT2qxlq@kuha>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:44:40 +0530
X-Gm-Features: AaiRm53X4ql3dGDl1tH7xeGeOTilv1agj8gPo1c_Im8EOGQs4xWezhJpT5k_0MM
Message-ID: <CAEiyvppvKL+mHpi9kN2z4DASn3Qetd2THBGT5AC8-GiuHKE=cg@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add UCSI_USB4_IMPLIES_USB quirk for X1E80100
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>,
        Johan Hovold <johan@kernel.org>,
        Venkat Jayaraman <venkat.jayaraman@intel.com>,
        Jameson Thies <jthies@google.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LOgnwhiBdGJt0G91Xgv_ohi5--EvEQ4D
X-Proofpoint-GUID: LOgnwhiBdGJt0G91Xgv_ohi5--EvEQ4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3MSBTYWx0ZWRfX74byVmgDsh5u
 RaDW7gg28xHPzbAD2QdGrXnBxmFg7VIgMjugUcXRFS26f9Td+Z+qS9T2iELxr5Irrz+69vbmGPQ
 gjYuAthIuna2GANa2q/TtFUTO/anNCR7a4PU+vsiJ1VDuTghhQYWcShJf0yyNbc3KZPienGprI5
 rKN2nNbXuM25Ht/LNxH0egV2Wlpa/rTSeYULCMuUoSqIiv4BhQMo+7RhFcxA58Bm3V4AUz5Zi8u
 8Nmhwza0hJCJg8I8hYMEriPyulbnCwk07BOGVtI8CJdfMTIiaTZ/Wc046U0cmOhgR6CNHbxWyNw
 QzTN/U3UirocAkXV00+c2CJR9SP/A1gdwHAxtjuE/TwWCW0rCkkoDlL5y3GEBiAH9zCBuzB74Kk
 Wiqwc8PoPt76dv78CEDFEn2YXhpYsNxYoQCQrbyF7bfGeCiNnoJNKzAg3NkF2U8GiznVFo/+DVw
 F3u4gsHWtBSR08N69pg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3d58d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8 a=fYMQSZtRpJdSnR-Sw7EA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34732-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 174A328053B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 2:24=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Thu, Mar 12, 2026 at 03:44:31PM +0530, Krishna Kurapati kirjoitti:
> > On X1E80100, when we connect a USB4 capable dock, the PARTNER_FLAGS
> > indicate USB4_GEN3 being set whilst keeping the PARTNER_FLAGS_USB
> > cleared. Due to this, during ucsi_partner_change call, the usb role
> > is marked as ROLE_NONE and passed to DWC3 controller the same way.
> >
> > Fix this by adding UCSI_USB4_IMPLIES_USB quirk and check for it to
> > decide and pass on proper ROLE information to DWC3 layer.
>
> Do we need a quirk for this - can't we just always check the
> USB4_GET<X>? With USB4, don't we always support USB2?
>

Thanks for the review Heikki.

So you mean check for all the 3 bits (Bit 21/23 and 24) and if none of
them is set, then pass ROLE_NONE ?
I wasn't sure if all PPMs would work that way or not and hence made
this quirk. Let me know if something like the following is fine:

!((UCSI_CONSTAT(con, PARTNER_FLAG_USB)) ||
   (UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3)) ||
   (UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)))

The if check would see if all the 3 bits are "0" and then pass NONE to
usb controller.

Regards,
Krishna,

