Return-Path: <linux-usb+bounces-28579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62751B97EE5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 02:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244654C1814
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 00:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE4F1A23AF;
	Wed, 24 Sep 2025 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="IEE6cQ3W"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478B1BD4F7
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674645; cv=pass; b=b5smGRLZvm8/N77/TJCbgkZ68+g+ofDHsnHt3atz6ufn3VIkATZbcABWCSz7T+3GhuIDncPQy3XBWWVlaX4G9WRmxVQQgYx9EzVzUsuJ7dfM85bcIjPBDbMWOncp5tPsg7+hB4Wj/uzT4ue3HjuIbRVhqFtZkJ+M9YbCvlKVWh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674645; c=relaxed/simple;
	bh=ZwY7elJLxMCUcM4OqF2KN140IIVFpJF7CufDPIW7CLA=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=SumOFEl2zvHlT1nZcBLGqMHqTte7E4cZhtvyX2N/FpU1p2nu9rvrpZdFqrWdvXgzH5YRb7V2mRVs49d8TX7Nfv4YM+bAu/1IC0BexV0ptnLoLDEFkS6dIflY/zkNytK2xVyFe2iZv1nUdREmM1l5ER1WNvRhC4il3aNDj5D8ApA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=IEE6cQ3W; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674643; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=HFplOmpGf+hUlNk+YEr+0kSIzP9Strim6x3nC+rBOu+HRZd3q1SrYly3jk+rQe2B5WsYmbxO4fD6TOAwSMAAunp5OdhsWiUKCuu76aAgBLxHhsHDzfvoW/lz8n3roOX5mb2PWjidZmjOEjYpwDkT+fMoxvGpfEeNM+l/X5uHrJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674643; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=ZwY7elJLxMCUcM4OqF2KN140IIVFpJF7CufDPIW7CLA=; 
	b=M0bHXadeEZWZD+1SwZouOmxewqg+pAKOz5cTTiB0FJmIQTSnYJ61q1Y4XDaoHUrkfWZalfE7Knspd8Wjg54c7e/vfXSyCW1rlbmnsH608rdiNJZ9lEYSKfCFvax9Sj427HjQqxXFJzRpws2VzCcyTfetcDKxZiT1LGbm56D7NUo=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9abed180-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653443579.5402979346853;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=IEE6cQ3W69b6XEAGGoa4T/VZrCgVGppfnCQvkRaM2y09vhebsbN8urowCjpPnya4fP8W9RDmN0jnB5rDe1PcxTPnsmXfZGs4jU7xF84FfYnczbaKYTUrmyoRx4bsPDztiJ7+0b/IZxS8dP1jc60O1mXyuUceBnJY2dJGOC5ywpo=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=ZwY7elJLxMCUcM4OqF2KN140IIVFpJF7CufDPIW7CLA=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-usb@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9abed180-98d8-11f0-8217-5254007ea3ec.19978ffc698@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9abed180-98d8-11f0-8217-5254007ea3ec.19978ffc698
X-JID: 2d6f.1aedd99b146bc1ac.s1.9abed180-98d8-11f0-8217-5254007ea3ec.19978ffc698
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9abed180-98d8-11f0-8217-5254007ea3ec.19978ffc698
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9abed180-98d8-11f0-8217-5254007ea3ec.19978ffc698
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9abed180-98d8-11f0-8217-5254007ea3ec.19978ffc698@zeptomail.com>
X-ZohoMailClient: External

To: linux-usb@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

