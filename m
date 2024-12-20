Return-Path: <linux-usb+bounces-18693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4169F8F80
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 10:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E1D16A5A5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA10A1BD9FF;
	Fri, 20 Dec 2024 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UBUBKu+E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8595D1BD9D8
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688685; cv=none; b=NErCb2go3mZnpif2xjiL7kQvPcnrq9eN89KRp0CbhfzxLG+H1jxK+Vu1ECPoMDY2BhLmgk9RBCsc+EFnV0dF+JZTkJZcTMA8ADe/e7xyQreJwbSEK4s9DbKk760zLbbS6SCk6JDAloHmcfYWBakVEk+MPaThFAyc9fTbEGY+tM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688685; c=relaxed/simple;
	bh=JV7zcf533trn9aE6JGdSSrLa7RjfdxV3RmQ9FF4JIYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Evgsn1eytgHaqgp2ngrtvnJA0j2X+Q2egm687wDjtqCLWufdOHETMly5ONru8F8SIp4T5StWEr0BTAPdZIenEwPRI31oX+S+VCMMfhd3CeSpoEdgiSEfTE5Xv6Wq4zx0v1ajHadxporC8USoVlP7ZbHQ6Hro535IvlTz2rsQy+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UBUBKu+E; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241220095754epoutp02d9b7211ff553357d794849063ead00fa~S2ii2cEyz1740017400epoutp02r
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 09:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241220095754epoutp02d9b7211ff553357d794849063ead00fa~S2ii2cEyz1740017400epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734688674;
	bh=mpuXmsNt6GgjKLVFSm8EoniE8s4eCfUeK50MGi/llMI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=UBUBKu+E3HGh8vl2TgRB5Xglw59HAyaHNGf50U1OD/TNmrK1r0i5FFPFd/eOfZo8O
	 5w3MdTkT6TKF259YgT16nQdg8Y6//9TUbtegVyPpaNvy4vDQl9a5KWVKsspDpFN7Py
	 I0DLt3ZARwxr0QBPqEMlAVssVoXFi9NBoH2y/ALM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241220095754epcas5p2e6d2b4849f41347cf2e3656bafa86fc9~S2iimbvcF2259022590epcas5p20;
	Fri, 20 Dec 2024 09:57:54 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YF2sX6q83z4x9Pv; Fri, 20 Dec
	2024 09:57:52 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	22.45.19710.D9F35676; Fri, 20 Dec 2024 18:57:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241220095748epcas5p13f052ca970cf1e2793b80a75b7a284f8~S2idWbUTr0172601726epcas5p1M;
	Fri, 20 Dec 2024 09:57:48 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241220095748epsmtrp29df40a76ff34a80ad33ff5c3ca72db07~S2idVxLHq2010820108epsmtrp2V;
	Fri, 20 Dec 2024 09:57:48 +0000 (GMT)
X-AuditID: b6c32a44-36bdd70000004cfe-38-67653f9d1f10
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.DC.33707.C9F35676; Fri, 20 Dec 2024 18:57:48 +0900 (KST)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241220095748epsmtip2fa7a1ea551503cc89701587a88d82be9~S2icf1bkB0620806208epsmtip2-;
	Fri, 20 Dec 2024 09:57:47 +0000 (GMT)
Message-ID: <ce3f239a-c8bd-428f-a8f2-71f0b5a943cd@samsung.com>
Date: Fri, 20 Dec 2024 15:27:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: gadget: remove not used field
 dwc3_request.sg
To: Renjun Wang <renjunw0@foxmail.com>, Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <tencent_0BEB55520D6C9419EC1AC6647AF19BF34E06@qq.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdlhTQ3eufWq6wYJ/PBbNi9ezWVzeNYfN
	YtGyVmaLHf3z2SxWLTjA7sDqsaDnPLPH/rlr2D227P/M6PF5k1wAS1S2TUZqYkpqkUJqXnJ+
	SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QXiWFssScUqBQQGJxsZK+nU1R
	fmlJqkJGfnGJrVJqQUpOgUmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsaZGe1MBTPZKzoPXWZq
	YHzB2sXIySEhYCJx/t0a9i5GLg4hgd2MEpf7HjNDOJ8YJd4c+8wI57Tf72CHafm7ACaxk1Hi
	+ZGbTBDOW0aJiX/uAg3m4OAVsJPYsS4ZpIFFQFVi/7EWZhCbV0BQ4uTMJywgtqiAvMT9WzPA
	hgoL+Ev8+HScCcQWEXCUePh5AzvIGGaBSIm7rwRAwswC4hK3nsxnAgmzCRhKPDthAxLmFHCS
	OLVmBQtEibzE9rdzwB6QEPjKLtHdtogR4mYXiVkbvkO9LCzx6vgWqF+kJD6/28sGYSdL7Jn0
	BSqeIXFo1SFmCNteYvWCM6wQ52hKrN+lD7GLT6L39xOwcyQEeCU62oQgqlUlTjVehpooLXFv
	yTWorR4Sa5e8YIME1FRGiS931zNNYFSYhRQos5B8OQvJO7MQNi9gZFnFKJlaUJybnppsWmCY
	l1oOj+7k/NxNjOBEqeWyg/HG/H96hxiZOBgPMUpwMCuJ8PLIpaYL8aYkVlalFuXHF5XmpBYf
	YjQFxs5EZinR5Hxgqs4riTc0sTQwMTMzM7E0NjNUEud93To3RUggPbEkNTs1tSC1CKaPiYNT
	qoHJZf8T7kNfhd8Er9y89PCrVpG8Z3VK7GcELt239GBOTndRZyv8PTvb65TrEQ7jbc43057s
	T/F2nX+rPOuQDGv5TaEXLgfMtCufz2R2l3syJ0OpdcaXuJ95ucoTasQ4Zx4wV3l1W9F6q6Ju
	u0OoUtrmnXZzFmeUsr/zbG0+XWJpX/Vo7n/hrr+nVlV52Vy5I/6+QGfP8r01c4ruch+5KZJ+
	xyPl4tyspQUd3gwBayxS7+gWaQhwuL452bFb8vZ+7eNnmr6LiFzUe2zv0tr2RJ8rXekEj1dO
	afb6iAfBh27PmJv7wmTj/OisvMuH17+Ici7l0Vh57EbBF44Ggful1j3v37pmPdY+LPRx1858
	YRUlluKMREMt5qLiRAB//J9RHQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvO4c+9R0g2fzzS2aF69ns7i8aw6b
	xaJlrcwWO/rns1msWnCA3YHVY0HPeWaP/XPXsHts2f+Z0ePzJrkAligum5TUnMyy1CJ9uwSu
	jDMz2pkKZrJXdB66zNTA+IK1i5GTQ0LAROLvgs+MXYxcHEIC2xklJjx5yQ6RkJZ4PauLEcIW
	llj57zk7RNFrRok/k74xdTFycPAK2EnsWJcMUsMioCqx/1gLM4jNKyAocXLmExYQW1RAXuL+
	rRlgM4UFfCWuX9oEFhcRcJR4+HkDO8gYZoFIiS0NohDjpzJKPL37nA2khllAXOLWk/lgq9gE
	DCWenbABCXMKOEmcWrOCBaLETKJrK8SZzECrtr+dwzyBUWgWkitmIZk0C0nLLCQtCxhZVjGK
	phYU56bnJhcY6hUn5haX5qXrJefnbmIER4NW0A7GZev/6h1iZOJgPMQowcGsJMLLI5eaLsSb
	klhZlVqUH19UmpNafIhRmoNFSZxXOaczRUggPbEkNTs1tSC1CCbLxMEp1cAU++GFuvnRVj/X
	owvuKbX51+7Wqr/29jDb+YobP5Rmp5wQ5Zf/ema1xaxgtt/qisWzbMUu2e0LW3Hbydet2ZP7
	S7mri3/Qca6a/S4n/zBrd+trSfzv/vk2srHU62zIy2OJi9NuSC2/cJeRreNvj/Qrp2mJ28tP
	Fxts8z2wamI7Q/iHU1GnTxUcMF3AeLtGRGuG6X1dRpuGaUcyXizSCNt240bVTaPwXOHvS5+H
	s+47prTSkn3r3Q1iEpN4pvnGFj/T7/Zfrqveni3zpGzaRP1chbRXTmWTm2Y28LOcqF/y6Hmp
	rt86q3OvL8yfzr+wRG2ZaqThM4PajHlW537Gla+X8jJIiWlWaWbaZzFv50MlluKMREMt5qLi
	RABpNrFa9QIAAA==
X-CMS-MailID: 20241220095748epcas5p13f052ca970cf1e2793b80a75b7a284f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241219151351epcas5p14f6be94bf65085f86d0163615bb81ae7
References: <CGME20241219151351epcas5p14f6be94bf65085f86d0163615bb81ae7@epcas5p1.samsung.com>
	<tencent_0BEB55520D6C9419EC1AC6647AF19BF34E06@qq.com>


On 12/19/2024 8:42 PM, Renjun Wang wrote:
> Based on commit 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling"),
> the field dwc3_request.sg is no longer needed and not used in any
> other files, remove it.
>
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>   drivers/usb/dwc3/core.h | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index ee73789326bc..3be069c4520e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -956,7 +956,6 @@ struct dwc3_request {
>   	struct usb_request	request;
>   	struct list_head	list;
>   	struct dwc3_ep		*dep;
> -	struct scatterlist	*sg;
>   	struct scatterlist	*start_sg;
>   
>   	unsigned int		num_pending_sgs;
The same change has already been incorporated as part of the following 
commit.
commit: 686d4a2c26b49 ("usb: dwc3: remove unused sg struct member")

