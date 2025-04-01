Return-Path: <linux-usb+bounces-22396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EEFA772A3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 04:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90CEB3AC37B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 02:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9911A841F;
	Tue,  1 Apr 2025 02:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TOuFEw4o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4649E1A3BD7
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473679; cv=none; b=cv+ZdAavwNCTCA5qwZBD0XBbNUPGY71hDMC4YD/UWe2DkTAr06G92Zu2guvAaSF61NyuO1bzKd9XbSrCbg2AGASazdxu5HQHT69wL7LR0xCl7ecI/7ywapHfJcvtkOGzeCivoAH9cG4l78SAFVqtypEDeKRXoAfM9P+qR3e16Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473679; c=relaxed/simple;
	bh=btsx7G9oLe745AyCwE8EiMzW96Mm8fFPN0r5Nj09QU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=csUYsJ4k/iiTlTst3R+3520kK+pbg7+NTDkT+2huz6NnQ/fcBoswb4/LObw5pPSrfrdSvvzCA1M2m1IBFt2DgHaH6CwHzLOwHlqceckqz+Gxf3DfPmo8HKT3BpUuaCt/l1gj0rH1IyLYezs4gCjfY60hJeWLqZZ0Ff6zON8BASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TOuFEw4o; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250401021429epoutp0306b073051c78fd12a7cea2f56df53762~yEBCxEGZ91303513035epoutp03f
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 02:14:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250401021429epoutp0306b073051c78fd12a7cea2f56df53762~yEBCxEGZ91303513035epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743473669;
	bh=7bcFPViTtsO+p+t1ZImtFXAyntpk+EDHZqlNKA6Gh6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TOuFEw4olTPDU1ScHlbbM0LQWlYP2ZauWyXqgYfusBsztcO4uwO6Dbd94KZiUG3lY
	 BoPzCCmNDuoJDw9+6ahHmScTn9JUDw+HByHeJq+GSysEe8cPpBHKo9M5PjRJQqVpO7
	 YhRWUUXEvDlNBsPt8cb6Bzlijvi0kzAAxLmqJgj0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250401021429epcas2p2402906ff9dabc07ca417a98c05fd3182~yEBCN5tQm1409014090epcas2p2Y;
	Tue,  1 Apr 2025 02:14:29 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZRWlm2pMzz2SSL3; Tue,  1 Apr
	2025 02:14:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CE.27.37303.40C4BE76; Tue,  1 Apr 2025 11:14:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250401021427epcas2p40616133da2f95585af5f83e355e0cab8~yEBBErT0m0916509165epcas2p4d;
	Tue,  1 Apr 2025 02:14:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250401021427epsmtrp28c03f61d7cb3ee24287566a1dd591f6b~yEBBDlwmU1626516265epsmtrp2C;
	Tue,  1 Apr 2025 02:14:27 +0000 (GMT)
X-AuditID: b6c32a4d-541ff700000091b7-49-67eb4c041e75
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B1.C6.19478.30C4BE76; Tue,  1 Apr 2025 11:14:27 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401021427epsmtip160f3d75d1ab0c4c53dd0924e5eafe711~yEBAxHCur0673006730epsmtip1q;
	Tue,  1 Apr 2025 02:14:27 +0000 (GMT)
Date: Tue, 1 Apr 2025 11:23:36 +0900
From: Jung Daehwan <dh10.jung@samsung.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Puma Hsu <pumahsu@google.com>, Greg KH <gregkh@linuxfoundation.org>,
	srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, Mathias Nyman
	<mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
Message-ID: <20250401022336.GA98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTVxjGPb29t+Wjeim6HXGZTZnZYANa5OOwiS7RuEuGCWNLmPtj2MCl
	MEpb2jKQkcGgfAZRBHHUMhg4QCZ28iGCRb4cDLaRZYqMDzFsUKWdToEVJgJruWr473ee932e
	c95zcrgYv5Ljxo2Ta2iVXCITEo7sK30e/l7sUItUNJrtis5MzxDoYucwC8105wJUeWMYR33V
	9wHKqjEQaE43RSDrrTwWKu76lYO+zTnPRmPzVhzd7NATqMJUiqHq2mwMZTWV4sjyKJON8jtO
	4ujJuomFyhvdUdO1IhytG69yUE5/P44aqro56IelRvAupNp1dzhUVVMSVWOcY1FNDfkENXnb
	SFDfDH5AdVVc5FA1RSU4df1BLUEVG7+kDC0jbKqlawFQC02vhvE+id8XS0uiaZWAlkcpouPk
	0mDh+x9GHoz0DxCJvcRBKFAokEsS6GDhodAwr8NxMtv8QsHnElmSTQqTqNVCn/37VIokDS2I
	Vag1wUJaGS1TBiq91ZIEdZJc6i2nNW+LRSJff1vjsfjYR+tWoLzumjKWmQcyQOO2AuDAhaQf
	HGmYwO3MJ40Ariy5FABHG88D+Fh7nnixKKkoAc8d/ywvsZhCO4BT2macWcwAWDiazbZ3scnX
	4N8npjeYID3h1PJPmJ2323hSfxfYDRj5HxtaTT0ce8GVjIc/VutYduaRb8KnX7dxGHaBg+Uz
	G0EO5AF4qbLZ1sPl7rBtYO5Jt+dAss0BXiitwe06JA/B/Aw2c1JXaB5o4TDsBhcedhIMq+H4
	PRPGeLUA1pu1GFPYC3Wm3I0xMTIWTq79jjGZ7vDGOJuRt8K8vlUOI/NgXg6fcbrDszdP4Qzv
	hD2W4WeJFCw7eRsw99OCwQHTCfwU2K3bNJlu0246WyxGekBDhw8j74ZZreeeybtg3Rp3U0cV
	IBqAG61UJ0jpKF+l2EtOJ794+yhFQhPY+CmeR64Ci2HVuxewuKAXQC4m3M77+N85KZ8XLTme
	SqsUkaokGa3uBf62ZyvG3HZEKWxfTa6JFPsFifwCAsSBvv6iQOHLvN7Hs1I+KZVo6HiaVtKq
	5z4W18Etg7U3fCVl3OKZdjlt8cFXT6e35sYM/VEWMRq362C4gZf1urN1LCER29p2obLklRjV
	e7Mdvn7Oi/FbZO4Tp2vqe1dDvPsy/qrMuLKtfa7d5KTsc9Sp2W3JdUebs985nBmy80mbvmg0
	2xLTHyW4I0inP9InDk2cqfs06OhsRNB36cWFVZedQ/lcY/6tcKehPa1arf6h44FUklw5VrYH
	obP9RsfUxft/RnW+9LM5aEt9npewI9n6Fj+nOM3iPuUjMITXR1ocrzmL5fPEQEF6ueDeYq3R
	xWO/Uyge8sXx3yRry0cSIwYv6TPNdz9L7U6pPbeWseyWNaLQFUabW3+RvfF9GTYiDxey1bES
	sSemUkv+B4ufmJ6yBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7bCSnC6zz+t0g22N6hZTHz5hs1iz9xyT
	xZMD7YwW84+cY7U4vOgFo0Xz4vVsFi9n3WOz+Halg8li4v6z7BYL25awWNz89I3V4vKuOWwW
	c59NYbZYtKyV2aJ50xRWi9cfmlgsOnf1s1r8+v+MyWLmWmWLTbv7WC3+79nBbtF27BirxaoF
	B9gtNnxfy+gg4bFz1l12jwWbSj0W73nJ5LFpVSebx51re9g85p0M9Ng/dw27x+K+yawe+94u
	Y/OYuKfOY/2WqyweW/Z/ZvT4vEkugDeKyyYlNSezLLVI3y6BK+Pe8qOMBQ8EKqYeeMDWwPia
	p4uRk0NCwETi/Y/vTF2MXBxCAtsZJRoutbJCJCQlls69wQ5hC0vcbznCClH0iFFiz6lPzCAJ
	FgEViTe9D1lAbDYBLYl7P06AxUWA7Dtz7jOCNDAL/GaRuL38DliRsEC2xNFFs5hAbF4BbYk/
	M7azQ0zdwiyxb813VoiEoMTJmU/AGpgF1CX+zLsENJUDyJaWWP6PAyIsL9G8dTbYMk4Be4l1
	8zczgZSIAh306mD9BEahWUgGzUIyaBbCoFlIBi1gZFnFKJpaUJybnptcYKhXnJhbXJqXrpec
	n7uJEZwetIJ2MC5b/1fvECMTB+MhRgkOZiUR3oivL9OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ
	8yrndKYICaQnlqRmp6YWpBbBZJk4OKUamNx5nF6ozFZ4Gmqs7/737UExTW+Gs+6rr3/Sv/TT
	4f30oOPsV+f4HVmbyfpoMZup1r2FT36dctf4qjvhepfNx+zpvxlmusU/2Fbeyqeb8tS8us1f
	Z/K5qO6+iqeVZVtL4kproyYKvT8bnLcyXyRiVuX+H8IpWvrslfkshQ/eK35IC8ycbvL3Sdee
	lIVr9NScNRSvvmldL7V7+nJbMWbWWXur9jl7ymty/f9aKFpUeuF9y6HOI4Ida6OiOwsagqqz
	GYv5FT6J68lIdWXVWV8vUlXYlTB1Tnt7/u++fecqTyfkHGmdJNVxIvvXj8usL/lPvOl/8L3Y
	hGu/1nHugFsmmUauT8TKT7PWxvz/L/lSiaU4I9FQi7moOBEADSCNCn4DAAA=
X-CMS-MailID: 20250401021427epcas2p40616133da2f95585af5f83e355e0cab8
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_66d1f_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250327161254epcas2p35ea7c80bdcefaefc645c061531dd6833
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-2-quic_wcheng@quicinc.com>
	<CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
	<2025032734-reward-fantasize-dc16@gregkh>
	<CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
	<CGME20250327161254epcas2p35ea7c80bdcefaefc645c061531dd6833@epcas2p3.samsung.com>
	<87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_66d1f_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Thu, Mar 27, 2025 at 09:12:12AM -0700, Wesley Cheng wrote:
> 
> 
> On 3/27/2025 3:14 AM, Puma Hsu wrote:
> > On Thu, Mar 27, 2025 at 3:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> >>> Hi,
> >>>
> >>> We have implemented and verified the USB audio offloading feature with
> >>> the xhci sideband driver on our Google Pixel products. We would
> >>> appreciate it if this solution can be accepted. Thank you all for the
> >>> work!
> >>>
> >>
> >> Great, can you properly send a "Tested-by:" line for this against the
> >> 00/XX email so that it will be properly saved?
> >>
> > 
> > We(Google Pixel) only use the xhci sideband related changes and two
> > changes in the sound card driver. For the details, what we actually
> > tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> > Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> > send the "Tested-by:" line to the 8 changes above? (I added
> > "Tested-by" line for this [01/31] first.)
> > 
> >> Also, I think a new version of the series is coming, can you test that
> >> to verify it works properly?  We have to wait until after -rc1 is out
> >> anyway.
> >>
> > 
> > I think this v36 is the last version of the series as I discussed with
> > QCOM Wesley. And for sure I will test it if they do have a new
> > version.
> > 
> 
> Hi Puma,
> 
> I'm discussing with Stephan on the QC specific stuff, so the common changes
> won't change on v37.  Please provide your tested-by tags for each commit,
> so I can carry them accordingly on the next submission.  If I do end up
> making changes to any of the common patches, I will remove your tested by
> tag, which means you might have to test it again.
> 
> Thanks
> Wesley Cheng
> 
> 
> 

Hi Wesley,

Thanks for your effort to upstream usb audio offload.
I've also used your patchset like Puma.
([01], [02], [03], [04], [05], [06], [08], and [12])

It works well on Exynos. Please let me know if you need also
"Tested-by:" on our side.

Best Regards,
Jung Daehwan

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_66d1f_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_66d1f_--

