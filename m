Return-Path: <linux-usb+bounces-11066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E690207C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 13:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96DF8284826
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 11:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64C87F7C3;
	Mon, 10 Jun 2024 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="t55c8XQt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D2D7CF3A
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019537; cv=none; b=p/26Kwl84SNT7nH/ETgpIKpkcdJK2b2zLC2dqlH1gIpI/jigeFWjj4w+TKp5uoGqxJmmLzW8xhuLPV3nzsSLIv7mZdBVpLoZr9zaY55m1NJEAsvXdNy4XgJjJ5JacwHcigOXXSHuIWPx0cgiAoupVaRZJvwGdC8puTiZGzy3Ajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019537; c=relaxed/simple;
	bh=4g0jh8mVTXXIWWd6K8v/g22BWViRX2KKtDtoBlE5OWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=oSZp6Z/g2l91E/K30VNxxnzyaVjbILuGctovZpXbdPcKgaQGrC+nYV3YFiHebn7366Uceh5waCZcHnHUrVY01GGTLhS8BwfaLELckAUJr2t1nInRHTd+VGrZWQ9wdeOYo+4F87rxjwKfiPhs66pqAQY3O6NArcu5FuVLe8wRCZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=t55c8XQt; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240610113850epoutp0432de14717d5112d8daf3a4a7cb9a155b~XoakL6_Zl1836418364epoutp04B
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 11:38:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240610113850epoutp0432de14717d5112d8daf3a4a7cb9a155b~XoakL6_Zl1836418364epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1718019530;
	bh=CYNsfsElRoaTG9v3KypueJ6qSMPhqLeAdpy+lkpm4r0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t55c8XQtKtc9f09itfza3EDkv6W7X6wMTdP9vT6ovF24m75lblYCRfWl/JZLMgKhY
	 6ZiQLPcp2KAWHhoZUWYQMitMIRNrOmYeJg2XkkzinbSbVZThOue7ge3NwAXI+B0rDh
	 q7DL3qj1LxRFrzAZk3chOgIJNHKUZhgu9MOzofxQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240610113849epcas2p388dc65dc0f10e659b47a897794f7946b~Xoaj3mQwl2563025630epcas2p3g;
	Mon, 10 Jun 2024 11:38:49 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4VyVF52xsYz4x9Pv; Mon, 10 Jun
	2024 11:38:49 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	C2.F3.09485.9C5E6666; Mon, 10 Jun 2024 20:38:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240610113848epcas2p3742cffc295e0ebb35713a761c06e1c47~Xoai0nwFN2563025630epcas2p3f;
	Mon, 10 Jun 2024 11:38:48 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240610113848epsmtrp18a605a9b73dccedda64478d9dbc69a99~Xoai0CNZ92145221452epsmtrp1c;
	Mon, 10 Jun 2024 11:38:48 +0000 (GMT)
X-AuditID: b6c32a46-19bfa7000000250d-56-6666e5c96fff
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BF.57.18846.8C5E6666; Mon, 10 Jun 2024 20:38:48 +0900 (KST)
Received: from ubuntu.dsn.sec.samsung.com (unknown [10.229.95.128]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240610113848epsmtip2812169bd042b5df7bfa52ac1001c6990~Xoain6lk21349813498epsmtip2d;
	Mon, 10 Jun 2024 11:38:48 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list), h10.kim@samsung.com, Daehwan Jung
	<dh10.jung@samsung.com>
Subject: [PATCH v3 1/3] usb: dwc3: Support quirk for writing high-low order
Date: Mon, 10 Jun 2024 20:39:11 +0900
Message-Id: <1718019553-111939-2-git-send-email-dh10.jung@samsung.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1718019553-111939-1-git-send-email-dh10.jung@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJKsWRmVeSWpSXmKPExsWy7bCmue7Jp2lpBhcbhC3uLJjGZNG8eD2b
	xd/bF1ktLu+aw2axaFkrs0XzpimsFqsWHGB3YPdYvOclk8f+uWvYPfq2rGL02LL/M6PH501y
	AaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QGco
	KZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEK
	E7IzGn4pFNzgqeg8MIuxgfEwVxcjJ4eEgInEnitXWUBsIYEdjBKv2zS7GLmA7E+MEstamhkh
	EkDO9m2aMA075h9mhyjaySix7ms3lPODUWLjlQXMXYwcHGwCWhLfFzKCxEUEOhgljj4/zQbi
	MAssYJR4cHIRI0iRsIC3xOLLViBTWQRUJRYencwKEuYVcJPYv0oMYpmcxM1zncwgNqeAu8TL
	+X9ZQMZICBxjl1i8rZ8RoshFYv+388wQtrDEq+Nb2CFsKYmX/W1QdrHErefPmCGaWxglVrxq
	gWowlpj1rB3sHmYBTYn1u/RBTAkBZYkjt8ChwizAJ9Fx+C87RJhXoqNNCKJRWWL65QmsELak
	xMHX56AGekj09nWxQoJkFqPExHN3GScwys1CWLCAkXEVo1hqQXFuemqxUYERPLqS83M3MYLT
	mJbbDsYpbz/oHWJk4mA8xCjBwawkwiuUkZwmxJuSWFmVWpQfX1Sak1p8iNEUGHYTmaVEk/OB
	iTSvJN7QxNLAxMzM0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQamwrX/RPatYpwZ
	Ev7huuyapY81AkuK8/tvOyju3/vEIjrs2s0p9W57Zc0rXgZV/1dKXLG91iEm5b7VpvDj7fK9
	zB/KZs5Zc7zRNOvRDnGBLYX/OX99TT7wrclJz7Jotq+WVOMMofWclxS7tL+tnf9cXy5s/cKV
	K44cd7v92uCIoMPkjsrfFl3PQkPvcem/bWSRfXxHj9X1dWFMmGtcYmQ62wr9T9lCwpdFOy70
	dj6o3Pt9DZ/lhjmmF6cf/rNDS7y1Mf3y/S+CIoGcv28ELvNaFbGh3dpzuR7P9Re3L5Zl/nrT
	l71bTYtjoerafQsChR3XsvdtPvRm38zT2+MFtVNU7ut8M47RaW78LGxtbnlNiaU4I9FQi7mo
	OBEAGHbrGewDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsWy7bCSvO6Jp2lpBpe+a1ncWTCNyaJ58Xo2
	i7+3L7JaXN41h81i0bJWZovmTVNYLVYtOMDuwO6xeM9LJo/9c9ewe/RtWcXosWX/Z0aPz5vk
	AlijuGxSUnMyy1KL9O0SuDIafikU3OCp6Dwwi7GB8TBXFyMnh4SAicSO+YfZQWwhge2MEl+X
	10PEJSWWzr3BDmELS9xvOcLaxcgFVPONUeLpg58sXYwcHGwCWhLfFzKCxEUEuhglHmy6wwLi
	MAssYpR403uHEaRIWMBbYvFlK5BBLAKqEguPTmYFCfMKuEnsXyUGMV9O4ua5TmYQm1PAXeLl
	/L8sEPe4SZw9vYplAiPfAkaGVYyiqQXFuem5yQWGesWJucWleel6yfm5mxjBgaYVtINx2fq/
	eocYmTgYDzFKcDArifAKZSSnCfGmJFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5N
	LUgtgskycXBKNTDlTLxVuPzYiYZVQjZGwTNvMG2fwWI/Jflayr0Jxi1lCfd8hAJlJhquu/iq
	tKVm4c21a0yXOb01SRFxzBM9klI44fv/p6LMq7V5812O3pLcMnH5w1f2dYdvLaj7x5vzpeEU
	v1zK+nVMN59791k6HWv/3vzn/wznD6Iv9ktKMy7Kb/1yR7TPmO3TgVlPvlUz+SQsX9IdfMn8
	dPyEbQsC95b4sfBftZnSWrXllWr6Mv6yK+xTszuKDGVv/bitNTX6U5fOrDlmP+8+m2JWtDid
	5cb1X/O2SL44cmFG0LmDrlJTpX4dvK3q+b6Jv8U6rXeT7kO2xLNWhYd0DVZLrpsgWX+ob/GO
	iFOf58rkm6xRK/5YpsRSnJFoqMVcVJwIANFQsLqjAgAA
X-CMS-MailID: 20240610113848epcas2p3742cffc295e0ebb35713a761c06e1c47
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240610113848epcas2p3742cffc295e0ebb35713a761c06e1c47
References: <1718019553-111939-1-git-send-email-dh10.jung@samsung.com>
	<CGME20240610113848epcas2p3742cffc295e0ebb35713a761c06e1c47@epcas2p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

There's the limitation of Synopsys dwc3 controller with ERST programming in
supporting separate ERSTBA_HI and ERSTBA_LO programming. It's supported when
the ERSTBA is programmed ERSTBA_HI before ERSTBA_LO. But, writing operations
in xHCI is done low-high order following xHCI spec. xHCI specification 5.1
"Register Conventions" states that 64 bit registers should be written in
low-high order. Synopsys dwc3 needs workaround for high-low order. That's why
adding new quirk is needed to support this.

Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
---
v1 -> v2:
- this patch is added newly in the patchset
- add a property in dwc3 structure
v2 -> v3:
- add change note
- add description in commit message
- remove the property in dwc3 structure to pass it unconditionally
---
 drivers/usb/dwc3/host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index a171b27..e0533ce 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -126,7 +126,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[5];
+	struct property_entry	props[6];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -162,6 +162,8 @@ int dwc3_host_init(struct dwc3 *dwc)
 
 	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-sg-trb-cache-size-quirk");
 
+	props[prop_idx++] = PROPERTY_ENTRY_BOOL("write-64-hi-lo-quirk");
+
 	if (dwc->usb3_lpm_capable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb3-lpm-capable");
 
-- 
2.7.4


