Return-Path: <linux-usb+bounces-22305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4BA751DC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 22:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F28D3B07F1
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 21:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573E81EB5F9;
	Fri, 28 Mar 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="EnthdZKk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YZCsfLvf"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49921E8345
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196096; cv=none; b=rcxVOGa8StKZEe54YQCTXN3w7CYWUN8Eg/PUr5S1P2e8JCRXdawsdKldZq9EYAVhn5nk8b1qR3EG/NMN20pkBPXx9W2V/0PUiH3SPJVjKytC/3SKQCh80pA0dWrZTuP/Cg9piF3RNit3e4IOXCmUEONCOFPsyM7YzEgKAIq5Kss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196096; c=relaxed/simple;
	bh=OvR+63KxGC/AQwsyyn8oRpDXFMt8cbCFistlmKu4Ojk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVgWTBLqtaKxkjeQ+tDCRLdMO/mG5KZgxXcxpti0Xk3OfhGo5M1VL8ScwfFLTyK9Aq9S3fKqPIyMj2NACmmlsWTnqy2eBG2CXfQTyWWKdP3P4Wk6+dEtVia9Z6ZlaWzJRA72fUyVx7oxDStxPnPqgpEOJayxT1NVa2cc80pcodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=EnthdZKk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YZCsfLvf; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9FC1A1382D03;
	Fri, 28 Mar 2025 17:08:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 28 Mar 2025 17:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743196092; x=1743282492; bh=jaD1cF9V0c
	0cTXgCQ0hX3QcvfLT9xVtCmFzQ5VUXORQ=; b=EnthdZKk0uC9h9ePiXXGQW3BnH
	rgPzDhclWnE9nwHl8bkFKZEyPMHunOw7VPXdfd0g4fqRYvEOyqdpddSl7iAhxkEL
	64xtrObRjl4uuiHpwmpg6tSIeSCgkhKI90I3yHieDC0p3GbGKdk6MdWOUy0eupGl
	lzDTgrWTg0EvrHJDV7EThgAlvh0MwZXfZKz0MpusWR2iTnXZDqWNBV1idRQam/a2
	LEL3XbbIu2F2zkJ3iW5MUb9fCYkeL8wfCmF04ILcKG3vAayMkxjNElLRktr9b432
	9hBkQqdgukXFfeT02MsqMzvoVgB56ppqJaSMLmyTBqcspQPgpD1TFSDR0Euw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743196092; x=1743282492; bh=jaD1cF9V0c0cTXgCQ0hX3QcvfLT9xVtCmFz
	Q5VUXORQ=; b=YZCsfLvfnAfsW2y6mf9gF6WlQmNjcb/k+u/g4pKJSGybeC8KGMQ
	5AJb9OiFOiB1/xEN+0rOXxMy/LaFtmXKH6+l2e8MZmsPbLYzDfGyfRYbdAUayHnU
	c3BIyNxRWwswUstLkvEKTtx/sTk1N4cFX0+gFDE8furtXWA5AGxIpG3o0kOsMDjb
	l1VXqAcaFg4ZHAiWbPCaumWVPRS6O/llNL19hARH78CzNERwvaUbHH5uEhSiaw4E
	Cy6MUQwx13KVDaSWve5/fuw4EYfRA1ZVerkotkT1uOdKOzQNh7d/Fykf+7rtzPG1
	eXUlRjW9AxbCwaUO56q+cTj8IYdM/GcXH/A==
X-ME-Sender: <xms:vA_nZ0odN1vCHE5sc7PwJ4N9Av2fN-Kv9HrU54-K5e-iC79nOEqssQ>
    <xme:vA_nZ6oQ9s6YJleYMkp2Fz_S9LtDnwapzNZPK3Z_ZgUDwpe0y5o1hpjbGfzADE_1E
    jBNdK-17Dx8JA>
X-ME-Received: <xmr:vA_nZ5Ms1vHwrzWuxLynIaiJqOkIstELG9CxtYVMTyy1lFPSFNMTUVeL9Sa1ytKwAljv5UsysceOO8qZ129l2V5kaFg_A1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedvfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhr
    vghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtle
    ekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhmrghinhepkhgvrhhn
    vghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegsuhhgiihilhhlrgdquggrvghmohhnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:vA_nZ754pDoQBhNtEgR5T5J-PqdCHdNhayUxWNy2hzCODu4FIYb6rg>
    <xmx:vA_nZz7h7QvtPtICIUIZ2UHIz3H3Ls3IcIdmalbHtUgwOKa2rmpKgA>
    <xmx:vA_nZ7g3tbYPRg3741F_qvNVX5DCXC9meJ8qQoJZTtgcP3ieDEu5QQ>
    <xmx:vA_nZ96adfsnMO8WHPCrQgF_rIEGkPHmzFgUc8a64SrN-WDbrTrTqw>
    <xmx:vA_nZ21nYA6h4bbVj3JJjah-CYt81tblHq7JCo5vtYQcOaTdSAxX95-2>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 17:08:11 -0400 (EDT)
Date: Fri, 28 Mar 2025 22:06:47 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 219951] Missing null check in ast_vhub_init_dev
Message-ID: <2025032824-amuck-stainable-249d@gregkh>
References: <bug-219951-208809@https.bugzilla.kernel.org/>
 <bug-219951-208809-AGW2CK72nL@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-219951-208809-AGW2CK72nL@https.bugzilla.kernel.org/>

On Fri, Mar 28, 2025 at 01:14:23PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=219951
> 
> --- Comment #3 from henry (bsdhenrymartin@gmail.com) ---
> This is patch file.

Please read the kernel documentation for how to submit a patch in a way
we can accept it.  We can't take it through bugzilla, sorry.

