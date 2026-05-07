Return-Path: <linux-usb+bounces-37102-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEwHLTPR/GlhTwAAu9opvQ
	(envelope-from <linux-usb+bounces-37102-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 19:51:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73A4ED138
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 19:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84F44309076F
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 17:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16AB4534B9;
	Thu,  7 May 2026 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsvsePii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWV+PWW9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66682E8B82
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778176001; cv=none; b=OlXLboc83JhchlZNZUW6hIu0TKzyWPDtntLNPmkd+XKSC7yeHFLNN5UFEswS8ildzQheOcdyJ6O4mC5wjfETmlvxVksgu4StbfQIsG0j2OFifU9V7K/xN2rcJDV9TU1ylJajvV88pCZYjqvzFHknm7LwnNxlBrqXNVaO3PlYBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778176001; c=relaxed/simple;
	bh=BBcnT8FPeK4abTcu2i/8oIfFI6fkvB2ekQLp/la84yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFwQ/mQ+vAIh11W8HB9YcHoJpNrlEFcjpQW8J+HxYiur9SA9yH51NJs+70EmKWt2FrwELqUDlYxF7UBvqFw//+stpg9hsmPrKVp0Zd1tvxe1JlDLtx3xyDN5zH1BV74FY0gv4O/9CQ0Yj+7008YLrH0kqd/sCTQW7JeJYKCIklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsvsePii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWV+PWW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HFsLe150879
	for <linux-usb@vger.kernel.org>; Thu, 7 May 2026 17:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NiDKZ1yuuIRdW9+9hVwMmDVz
	3R+uYcpTYnfu7tVu9Nk=; b=ZsvsePiiYE5MNRoM0kyXNzJ9BrriJGbNdRCzaycM
	48DiWK2HD4EfVM4pDARPmY+niYwQy3wAmYjPTUIcWvsWYBXCf+qIeWkNCkIWt0tR
	12f0paV9B9/TgKyqCchEG3QoY02J5onOYQpPsZ2hbtBSWEd0j7XXKs+w7oMMlbHv
	Tp8wFyBGU9AFJuHCHwI23pf6suZnwJ75S/oTx714RPi/ThBmZQtm2P7ORYtsMWB7
	Q14kT+NfOM+TOgWm6FJtIGyr7HgEw2aCzzjTrimtB9XDB/oJrH6w352YFqYt7G9j
	jyXr9iSBdVqIejTU3XkhlGhTbmsZ8KC07wAhfDF8vFp/ww==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctu5ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 17:46:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so1139316eec.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778175998; x=1778780798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NiDKZ1yuuIRdW9+9hVwMmDVz3R+uYcpTYnfu7tVu9Nk=;
        b=cWV+PWW96jOjwjRNtsdwpJvbvveaajZuGt7529aBEfke9j56r9JezpjkyD4nu69HVE
         buch9yt9myqAGIyhleDdtW+elmeaZegQvDl862NUnBTYk3kZSHVXwJP7/3VT+J1aEl63
         kfLE9+1/Cq8IaEsp8z+bp2GXq4DkQSPeIb9E2E4Bh3QWp+BKgLvSqoq/nBy7AqlZt7by
         D8/ACihiwKCUkBrKAls76bF0uJ6m6LT9eL1Wndv0cpYDs5tE4QSbXLYNpBY9pIMOMKl9
         xMNO8yToFOTPlqv1BSu4LLfEpmj9/vyl9h0eg2uJ4HzpIgI1cRBuGpG3mIhZOB+sNQbc
         u0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778175998; x=1778780798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiDKZ1yuuIRdW9+9hVwMmDVz3R+uYcpTYnfu7tVu9Nk=;
        b=SO+6bW5sHCLIPDLhw4uyP/Wz8E17riS7IOLGN/MonZU29vVt6cMHSEvHud9k7NQ8UJ
         9cLT5GSjnTM2Wu557zcKYIJPWTzo7VWxhAU0DKAabtqroIWZMCj01YS4qznduAoXquvW
         moRwTf4CYkR3L5DePPdtjJ3neiiJxAXxL9eNL1+bNEJ1aYnFsV33mOK3APbQBlCGb+p0
         2um/3qRpDWwjqZU08zLj6yZ4vmnZJA8aj1R5SUdvaPfXul1HXvkTxPsnl24NWYwKPa97
         GZ2UL5RMlL25v1UG/7nuzIwpbyECU5oEC3SYzl6xMohmiu4GYVG9QPOb1XHZZA06hW6k
         doKw==
X-Forwarded-Encrypted: i=1; AFNElJ8U2kHcYVvd/RG79Dc3b3Z9fs9oJu7quxRssXZ58MzvfFG3++bKJRnYPq6bp2HWTXOA5g08VhbLQ7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCju1avdUzLVuKerwQlm16xoZ3Y3FcLDP3mWGayw9WsX7DXcEy
	iXbz3nJXXYaPd0AxIdzvWctLCekn3CqvRuAJR7/sFtW+PYQ7KNUQVOrAkTW7o1tkNGDO26ocZ9D
	W/XrvwA2CHPiTJ4HAvNN+GBUhYOo9pRlhOhr4xidxDNjZtqQcCz7i2P5+6wvS228=
X-Gm-Gg: Acq92OHqPPcjJ98ZO3w3yr7I+caJJnJUAfMt/cUFmOXSik6VHhR9cSSgLXDORDK3JHJ
	gHhYiNkhRxwD/Li34gLYWdUFqecDpAJ6yfghbGLzwsEWua8zQiezfEnohvLdXyEzYjl8yNlbR6V
	NB6R43WL1fEsN/CLj5lVlk+ak/eFYubq00anbG8S2bBY3OrCMEbHY7alAzvfJPvsu0SZGicvcuQ
	BW1+os7ead8qxc6563MnfCKPbD+fAToZcog0nf6zsUazGp9X9QgQPcBBpMD2u1rfDCk2wlX8QjM
	9A8UkLpkyNLqyaVm0jRUWtsuD9I60NSyQRm5Rrlbrv6OTsr90hteaiJ+/yh+Hn+xqW8vR00OdMu
	rrCxtF1tPxVuzqwzXecbHJI8jYYEkyBRRsPY11nNZu88sfFn3YSpl6WJLs6ijR6+crmZm
X-Received: by 2002:a05:7300:b906:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-2f54996fb19mr5147216eec.15.1778175997728;
        Thu, 07 May 2026 10:46:37 -0700 (PDT)
X-Received: by 2002:a05:7300:b906:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-2f54996fb19mr5147185eec.15.1778175997048;
        Thu, 07 May 2026 10:46:37 -0700 (PDT)
Received: from hu-jackp-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f7967cfsm9504959eec.19.2026.05.07.10.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:46:36 -0700 (PDT)
Date: Thu, 7 May 2026 10:46:34 -0700
From: Jack Pham <jack.pham@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Message-ID: <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fccffe cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DJ0P9IFMZVm84kehXPgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: wILZcUBnLHA6J_DljmVTOugWPYPCrD1A
X-Proofpoint-ORIG-GUID: wILZcUBnLHA6J_DljmVTOugWPYPCrD1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3OSBTYWx0ZWRfX7itLMHy6gNbr
 idqjOGT+wYLT2M+lD58ylrZAtgFZZnurUB0P4U7PIsNYOc4tOV9V3KT+cG3J3/NQcRHaF4jnzRL
 lFu4PFwTW0q5r85vDEidQ5rD3fTRh4SR9H2t24Y/lwLatQadNTTXJGqUP5p7npbFDJtYWPlJV+/
 pbTr2J6SenmeDDAXqTYernT1dPkjbMxIAw5Us2cWjx09K6ckYCiwf2ABBJCSkbmXh4/T84BtsNU
 lQLLVu7HnR5ud29xDJEevS9n2v/Q2HGaOrqnWBXQnXX56f5xGNsN63RoIMB2Oil4x5eekhN1+jB
 moChkUNpBXRJZxKtajEplocRvRg3ayT4l0zMsNlwPbXxupyX84qr+DLQBuh3bp4FGs7TqccXQU+
 XF7hyxIjK+GiJo5Z/Fm4C9M1FcpKPe8inEijheGsTunX0Iw60K/Qr9aMThzLMQWWY4Uodl6zpvl
 WtTycKwwxVL7lSVVNYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070179
X-Rspamd-Queue-Id: 1A73A4ED138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37102-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-jackp-lv.qualcomm.com:mid,portsc.tm:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack.pham@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:34:50PM +0200, Konrad Dybcio wrote:
> On 5/7/26 1:40 AM, Thinh Nguyen wrote:
> > On Tue, May 05, 2026, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The Thunderbolt framework relies on the USB core to create device links
> >> for tunneled ports, so that the USB3 controller is only kept
> >> runtime-resumed for the duration of the tunneling. This depends on
> >> first knowing whether a connection is tunneled or native.
> >>
> >> Add the logic to handle that for DWC3 controllers.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/usb/dwc3/core.c | 12 ++++++++++++
> >>  drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
> >>  drivers/usb/dwc3/host.c | 12 ++++++++++++
> >>  3 files changed, 42 insertions(+)
> >>
> >> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >> index 65213896de99..7cec4911e278 100644
> >> --- a/drivers/usb/dwc3/core.c
> >> +++ b/drivers/usb/dwc3/core.c
> >> @@ -162,6 +162,18 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
> >>  }
> >>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
> >>  
> >> +enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
> >> +{
> >> +	/* Prior versions had no CIO support */
> >> +	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
> >> +		return USB_LINK_NATIVE;
> >> +
> >> +	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
> > 
> > The CIO register block only exists if DWC1_USB31_EN_CIO is set (and
> > DWC_USB31_EN_USB2_ONLY is not set). In most cases, this register block
> > will be reserved, register read of reserved block should be 0. But we
> > can't guarantee that it will always be the case.
> 
> That's inconvenient because..
> 
> [...]
> 
> > We shouldn't need to be doing this. This should be checked from the
> > xHCI driver. Check xHCI spec for PORTSC.TM and USB3 tunneling support
> > capability (section 7.11).
> 
> ..I'm seeing only caps 0/1/2 (and 10 on some but not all) advertised
> (I ran a for-loop checking offsets 0..=255)

Right.  That section in xHCI spec was only added in the 1.2b revision.
However the DWC31 IP versions that current Qualcomm USB4-capable SoCs
are using are 2.00a (and a customized version of 1.91a) which are only
compliant to xHCI 1.1 so this capability is not there, even though the
CIO register block exists.  So short of having the proper XHCI bit, this
is the next best, non-SoC specific alternative we've found that can
allow XHCI driver to identify when it is operating in tunnel mode.

Jack

