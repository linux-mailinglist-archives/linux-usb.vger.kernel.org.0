Return-Path: <linux-usb+bounces-12810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041F944330
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 08:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BBE5283B44
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 06:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8124158522;
	Thu,  1 Aug 2024 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QhDBPT5I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82050158856
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 06:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722492566; cv=none; b=m1OTK/+yYsOt1m1GJVcyqgS3FUiflEccHsbr+dsVgzXriYvcFokEZvwBxjrMErFFYlbhO7ptTZycIEAvtgYaHRJu/nG57m7Z+hlk8XMrS7W3ilKw7ToY/3Rq8Q+aAY049YuqXm4kbMn7fbQHKt4zG4z1yMQlTIJfKQWx+jXlDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722492566; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Mime-Version:Subject:From:To:Message-ID:Date:Content-Type:
	 References; b=WG4ap6JbU17oOCj/D0N7fqhL6Vfe3KU0nvU4Z//BSCOwuNHPKXVuXIUq/jB8djPX5Oufo+Y0kidTElO/uA9Od7Snm4zQ/7xn08qgba8NF722BNfISaDbA4fouTKePtK0CKUksJZWxJyV6QQyc56Y8ELeFWy9G1WfrI8T8vkSeoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QhDBPT5I; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240801060921epoutp0282c1ac55da52f45f865658ea74137d15~nhdvAMQiG2464224642epoutp022
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 06:09:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240801060921epoutp0282c1ac55da52f45f865658ea74137d15~nhdvAMQiG2464224642epoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722492561;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Subject:Reply-To:From:To:Date:References:From;
	b=QhDBPT5IZ3pLgYEj1LrGseGsd3ZxRJ8IF7tPTOsUFEjcwDByyT78NYCd7oFTCUBlU
	 jFS3OxfADx9P7cjGbPDwGEBc2IdWT62/RIRSxhFGJBFHA7nBvkitv3NU/JQ24CtFv7
	 Qj3yAgV/2FC/JKnf8gzEK4/Owv+715UReoh35juI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240801060921epcas5p11f0e77fe0e5453c0a267178e298ed635~nhdu0yuT22475224752epcas5p1w
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 06:09:21 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WZJSw3tcsz4x9QB for
	<linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 06:09:20 +0000 (GMT)
X-AuditID: b6c32a4a-14fff7000000260f-bd-66ab268f95a5
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	DE.3B.09743.F862BA66; Thu,  1 Aug 2024 15:09:19 +0900 (KST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Subscribe linux-usb
Reply-To: selvarasu.g@samsung.com
Sender: Selvarasu G <selvarasu.g@samsung.com>
From: Selvarasu G <selvarasu.g@samsung.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240801060904epcms5p573d3e979a38c94e73a24f714fd576837@epcms5p5>
Date: Thu, 01 Aug 2024 15:09:04 +0900
X-CMS-MailID: 20240801060904epcms5p573d3e979a38c94e73a24f714fd576837
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7bCmlm6/2uo0g50vRC0WLWtldmD0+LxJ
	LoAxKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB2io
	kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafApECvODG3uDQvXS8vtcTK0MDAyBSo
	MCE7o2f3BbYChgoQ1cDI0MXIwSEhYCLx55RQFyMXh5DAbkaJf4sns4PEeQUEJf7uEO5i5OQQ
	FpCRONzWwQpiCwkoSkye+IMRIq4rcffrd2YQm01AW6JpTSdYjYiAtcSkB5+YQGwJAV6JGe1P
	WSBsaYnty7cyQtiiEjdXv2WHsd8fmw8VF5FovXeWGcIWlHjwczdUXEri8t0GqDnVElcX3mMB
	uVlCoIVRYt/d44wQv5hLrL8tClLDK+Ar0XtyBRuIzSKgKvF8+XKomS4S8zdtAZvJLCAvsf3t
	HGaQVmYBTYn1u/QhSmQlpp5axwRRwifR+/sJ3Cs75sHYqhKnGi+zwbx1b8k1VgjbQ+JBxyMm
	kJFCAoEShy97T2CUm4UIz1lI9s5C2LuAkXkVo2RqQXFuemqxaYFRXmo5PAqT83M3MYJTkZbX
	DsaHDz7oHWJk4mA8xCjBwawkwit0cmWaEG9KYmVValF+fFFpTmrxIUZToKcnMkuJJucDk2Fe
	SbyhiaWBiZmZmYmlsZmhkjjv69a5KUIC6YklqdmpqQWpRTB9TBycUg1M8VO9TJ8v3rFd++9z
	4dy6gtLvN+TftE43Zcw4v/NH9fSFdqZ2fGIV6/5GSVnxKGn5lHIdengosfui1seZU2YlXZs3
	Zdu59fXN7a52J57ZRQhqJ/NsiJq75pa+r/PEZN20iS1ftYIeLOG9pX27de+T2c4qe8/efB3w
	cse0+t49lnfCNrnnh5yeeFboXeqNUt/KFcwc84+v++fx9VdubeubiuSMrSeer7Wqa9gZc140
	dUV9htXhA/ufGHhmO3kKM77njjLUC8z8vnIN97K6J4ezjm70c5Z2PjFdfkFlC9PLGOEiFYPl
	Ab+0vT8tyJZ7a7wkahPvCe+N3hX7zq5a+OLwbv0j8/2Pr/rxyyhWPdN+uhJLcUaioRZzUXEi
	AMVziQ7OAwAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240801060904epcms5p573d3e979a38c94e73a24f714fd576837
References: <CGME20240801060904epcms5p573d3e979a38c94e73a24f714fd576837@epcms5p5>


