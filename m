Return-Path: <linux-usb+bounces-37402-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGtZMlejBGogMQIAu9opvQ
	(envelope-from <linux-usb+bounces-37402-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:14:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 868AC536DCA
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2D53300617F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896E84ADDAB;
	Wed, 13 May 2026 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfoCF6bL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzSbsJEe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBA14A1384
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688826; cv=none; b=e02gqvKXtIKkaoo/imr+GKf+OPsUIwEIXBXK2YmBrTVGZW0ge/zjn8QSD9wk+B8EBnbliWjXjxZUBJMbTZs4kQzBOoyfWl+j8FtadvwC08YLLx6CBSor1vn5R/z92VAmaaaqQAYbnTEhshLxMHeu6Ln3GIATGbbIDda2bDkAdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688826; c=relaxed/simple;
	bh=fvnfR2iA9n7LcCPvGO4PY95rWrBbkjI47BwCikyfGEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=troTK64/TDc1JDJ9egK8rDuOFVPssG7W4385bJd76Zm6Ezl56O/650a0SWkxmXA1q7LsHHasEbwBwebNjZj/4Up94YooiuScGVwuFeI1OJd5HdBoXvy292oN9WkdBno3b6MM0RbFb6Su81j3Y/S0SVpIhZ6SRsoeil3eJN2jSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfoCF6bL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzSbsJEe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DANuLS2321230
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Upfc7fQDaVrjdijSQlAhPGt+
	ECOd1/2/bT6mUMv5Hoo=; b=PfoCF6bLI/qwbmjlqH9c0qUzjwRJirXLTXGLZ5XW
	m/lGnWwdfOyHiJMWIjqbYwFXhew59kiqqF1thnY5yt1DkYDg/eK7SZRYWQDPaD6T
	UQKPHVvo+D+LPu+JwckEaWOBOgfG/uvNzo2mDGw827DCujmnzziYARAJ1RNtWgWi
	yRJgqXK8126FPlYoiKAlFXjwcuz9DG/0+S1Urt+5UTGeaZ7jMAxxe7xnB4TIIBtW
	1ufz3gOxtYYtxdiEUWRazGm+inWEFRWz5XZgMe5r+tBwGWskYVYEitgqD+P+8K0w
	Ezt1nHUJZKTvme385fvW26ewHIQ3xZ9KIc8AfQQVOssEjw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguavwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:13:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so2590999137.3
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 09:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778688823; x=1779293623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Upfc7fQDaVrjdijSQlAhPGt+ECOd1/2/bT6mUMv5Hoo=;
        b=OzSbsJEe26tA3vm4IBZ8GEvlk3dQVXtpcdr7KsHzYXVoS+WMDaVBOSZClOiW0/9Dv9
         JWy3UgHcBetHRO7IBwUsvkHliak64ikp4GtxWm0BRf7ydTVHFw66Ph1xniXMVMJ8t+5a
         WRwHRKHqutH+UMtFCsPer/LaxmvBgZlk0TiLX9CzsEz8VpHviC3MefbEoRYWtzBSJJUK
         272vrHGJEANHiUzdyN3MoCAI8apTIfhHt4oMSUzDxkg0HUvzyg5b380WnUeVDP84wUNu
         9ZI7JMGRXuPZYzI6kZ2lBxVTvf9vxkX2gXyWBve4YrLJYcBr90ccuAI1WzUi+rJIu/Bt
         +SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688823; x=1779293623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Upfc7fQDaVrjdijSQlAhPGt+ECOd1/2/bT6mUMv5Hoo=;
        b=UmAo4uBWy2wqTHAeVCON9MOxais5usVd/up+53zwYButIZvjmNhZOKesbfDPoyxAfi
         HAoq5vN1vk6zkliuuEpcdgYixrjdIrEB7kcBd6JvmOkN1fD1U+yHl4xi4GD6yBlxsS++
         Lb2yhLCPMa9s+atJ2nkUaTH1M1eJlqzpSV0RklykIs5/XqhCptnWgnsY2JRHnRipiXDk
         QWEAjuiHPyQhnk7dKdz1mB6uMPnY65pF1ejeV34xCki/vM3L753AsLUH9yq4hfx/ftf0
         Kxe9Vcnaw0Q0FZ/KNy+zR3I3QuboGMT0pdGD34HWL1G9v9sVdPyvJfl2QQwbJTInm0D5
         151A==
X-Gm-Message-State: AOJu0YxJsR85F0ZMN1/Pre/lyAesuNLi7cDb1EiMhklbrc/Bo5SG2u5x
	JCZo3FJEi9WEd7rQvOMrLHr7/K4Kik9fyvyFjCGtnhgjST7vZB0TmJ+Qb0f4i7xWo8L9ZwmeupW
	TXHwZuDGfct5eJJIaKa4c5cBzZ/pb8MGUosEZ6IWQxIAGwilEUFXnkdLrtphQK+qjG3J+sNE=
X-Gm-Gg: Acq92OF5dotIMjnLsIqug6utvlxVdxik9O1zP0xVgaDMndIuTOtaknY2Uo+CN5IpxWN
	IIwH6N6zP/O9qdIDKmWfSkSUzIxHkPWqg6iL81N1mO7SOEe3oy5DNoUR3Wdx5nQn2K4s2udG4DN
	CJbPBlxwS06HRB4ILHInhZxZSYm8+P8No6OuvOBvMpLPEaHH2uR6xAWnMGYBFQ/kGfBELI73sil
	zLtdeSKCaoPj7jQgs1BoIVOPQ0WOFwudv3xLY+trXyGgveZxwTbF6xNYqWQNfFIjCP+QSAPelAH
	pSQu3WGHZDjcjRHjlw0bTnibI0GCynKIWOepmnKFFEpnPPGHspU9FbAaaOPln+DB2LjQtqs0wZ+
	iOXA2wFi+atVdSqXoXsS1gcFYAPP3EAAW2yEL
X-Received: by 2002:a05:6102:800c:b0:632:8eb6:7a1d with SMTP id ada2fe7eead31-637728c92d7mr2310111137.9.1778688822725;
        Wed, 13 May 2026 09:13:42 -0700 (PDT)
X-Received: by 2002:a05:6102:800c:b0:632:8eb6:7a1d with SMTP id ada2fe7eead31-637728c92d7mr2310017137.9.1778688821988;
        Wed, 13 May 2026 09:13:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45cb1489594sm5559612f8f.5.2026.05.13.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:13:41 -0700 (PDT)
Date: Wed, 13 May 2026 19:13:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>,
        Nathan Rebello <nathan.c.rebello@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>, stable <stable@kernel.org>
Subject: Re: [PATCH 8/8] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <3uwrju7c4fpicsf6ljbe32meaprlmr65zi2tgsnsewm3zts7ig@il7u6lcy2pmm>
References: <2026051347-clustered-deflected-9543@gregkh>
 <2026051351-truck-steadfast-df48@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051351-truck-steadfast-df48@gregkh>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04a337 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QyXUC8HyAAAA:8 a=cm27Pg_UAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=5QnhhkfV6Dw0aAHa0ssA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: fA-oVd8hz0yKVnz5vBxuLCm0Ouqo5-J9
X-Proofpoint-ORIG-GUID: fA-oVd8hz0yKVnz5vBxuLCm0Ouqo5-J9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2NSBTYWx0ZWRfX0uQwoXzPe86w
 kekVwo6cFuwCwK7mQH4Hz3MWMym6y6yfX3DSrMw31LqqBwh9UeEJ5SU2akRK1WAHHOazgQh05RD
 I5uRDxbg2D/+d/D66LOAjKlArlJ3xfyV5uATGXDpfEgV2a6gTRsSI+wo/j0l3CZpV72Ze4wpIKg
 bq2BRn7tPedPrupR5p6UM84ECg+/yHyIUgTDPY/H3K1lZUoo0+lHmdk8GwI6fdwpQTShc02z3LX
 bfTfdLuvCYM22NA1xVGb+5wu36ceYHPDPT70496vlHKzuDvRKvZMHhErTCKcg7Tsmv1x+ywnOqQ
 VfBMKGVX8nCfzi8rjcBFXB2qx9peO8Is8jI6G157g/VonXADMdJKax2qItCTk+LoFdGAL/xaTau
 xZ+JJZOdZxrRRd1b5u+q9Oe9U3RN5JOwDIGcM6+5GmO/hsebUZTGZlN+k4K5iQHPYBja32+7U/D
 0MyjarhvCoUKC42LB6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130165
X-Rspamd-Queue-Id: 868AC536DCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37402-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,chromium.org,google.com,gmail.com,kernel.org,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,chromium.org:email,intel.com:email,linuxfoundation.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-13 17:52:55, Greg Kroah-Hartman wrote:
> The connector number in a UCSI CCI notification is a 7-bit field
> supplied by the PPM.  ucsi_connector_change() uses it to index the
> ucsi->connector[] array without checking it against the number of
> connectors the PPM reported at init time, so a buggy or malicious PPM
> (EC firmware, or an I2C-attached UCSI controller on the ccg / stm32g0 /
> glink transports) can drive schedule_work() on memory past the end of
> the array.
> 
> Reject connector numbers that are zero or exceed cap.num_connectors
> before dereferencing the array.
> 
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Nathan Rebello <nathan.c.rebello@gmail.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

