Return-Path: <linux-usb+bounces-22293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4DFA74936
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 12:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6115A188A560
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 11:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D371721ABDF;
	Fri, 28 Mar 2025 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Bj0haRSK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kJn4SLtT"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178E21ABCD
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161246; cv=none; b=HSd1/oz9G4EXXxJ8MzDgoloRLcUzqLLsgEOZg+wFwPfNNSQahUiYxoM1SLPdzksWmspJL79v+62sfuOtuOjrum8Bjs30LDAfBYrG+uAW59YnB0Sci9Pl0UlCGrpufwJlrOgvioWXnQezEo5OshUWfHl9FFrSgmQgIIcLAbZVhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161246; c=relaxed/simple;
	bh=sU70KVcRCAmuSj3HJ8+zxmXAHaSqz3NUybXxw2SjAII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onD0C5I6Y5BnlvSLBVPiKvzjaOqGPD2s1fZjuGcvvgq8j65YDOOXFUlN+APlcA0eD4dd+YTfkC6XUH1bKaWGmb9oVRi7nvIniyLN6p+e7l0U14b+hK9mSXNuQjSEufGbbz/N260RZXA7GKS9st7XhBq5suXJRc15hfXBnwnJd4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Bj0haRSK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kJn4SLtT; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 33ABE1140109;
	Fri, 28 Mar 2025 07:27:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 28 Mar 2025 07:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743161243; x=1743247643; bh=Fc0rY1OG6W
	OcEVe7FC55Ap6jhpdGfdyamxg8HqcXCrg=; b=Bj0haRSKdNhTfPqXVdf1Lp1Yoq
	HYTRdu/nlfGd8bUZ+rEv2HwNdoabq/j4Zk6JwYDzKnmOjgpPvFkADMm4Bt3+mmLL
	3oskdChO08ksXdouJfI6+KRAbFoOgRzRW/0XaVg1BKjS5Xac7JGR1t6vpH0cHQoA
	OZ3j9JnfmEvgakU+iy2PyCo1AyguHIBcgM//YHETBu7syIiw6BAOFB3+IuuKDPQc
	/cKU/knmiS6ivrSe490R9GYUUz6MjndZfsB2Du0w+aNl6+RkYpDokFekTDWqxoB6
	qry4Z26mXM9dekw0PIBgUZBGkchHgMSVrtpyrcsIyZth1yIWbQqGO/SLHBFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743161243; x=1743247643; bh=Fc0rY1OG6WOcEVe7FC55Ap6jhpdGfdyamxg
	8HqcXCrg=; b=kJn4SLtT/qRIM0+hd1Y2XC135Ut/QgDAkUNDV+zWRa337wcwimF
	HU61NhSS8XX63yGYJSUKjGpDD35T7ucCaYUeY8Lg0uv74FPPdlnSc9WvWyMeScjR
	OgdwojH8nrK63bqURtZq/sPD0XalUW4E0qvA2Pt/2k4wxcJmX3VLYxGYN/2a7CkJ
	uP1OpcHqXPUJ2NVAXMfCRLtEAIldQFZDZZ13wqIsmR6de4yyPWmzRktv42cQEl6Z
	Jter1nb53Z6Ai49cCYPcnviN7zncDfbxgGOIeuFNKu/nQdR+xYYzqIKDxWHK4Mq5
	zkUAkuaTaazzFt/vRzu7Oxiqm+SNU6hKrfA==
X-ME-Sender: <xms:mofmZ4E7el-RT7Xyj1aLz0m2ffKKxmmhl_AApEvftnf-se7UlCfhzw>
    <xme:mofmZxVYY3mWr-fhM9D_6P4XryfY1VzEf3ivQGX972boigjmSYFFeL2-A2XPHVMuR
    nB1Z1slShvTnQ>
X-ME-Received: <xmr:mofmZyK3K1Htu9_wSZlxvB8LHz3o9HmtRKaQFDjaMdnb2vOP390PwK8wY7fKpLhjuySMTUL3pmRhLcZ25tdMQ4RILkvw5w8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhr
    vghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtd
    duudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnh
    gspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghughii
    ihhllhgrqdgurggvmhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mofmZ6HxYGphDHWnICHQ4LST5NhX0R6PCf8n_-lfUqUagssOirIgVw>
    <xmx:mofmZ-VLDf9bYeve98VvniTTLoyKZrcia8P_7Sw3HcBinl8Pq09ygg>
    <xmx:mofmZ9Oq25hRA4IDZVeqWq7FXJChJe89Kw3aRoH4Z-d_Jn37wy8SHQ>
    <xmx:mofmZ13fIlg8Tu_GId6d6CiwPgNa6AouIwtmIEHLyBbEskxCIR7Jkw>
    <xmx:m4fmZ8wcnGV6c25r4iFZTGFkR5jsU-UZE5BWO4wxd-yQa3t5X4ODHW2p>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 07:27:22 -0400 (EDT)
Date: Fri, 28 Mar 2025 12:27:20 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 219951] New: Missing null check in ast_vhub_init_dev
Message-ID: <2025032800-tamale-amendment-c049@gregkh>
References: <bug-219951-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-219951-208809@https.bugzilla.kernel.org/>

On Fri, Mar 28, 2025 at 11:15:22AM +0000, bugzilla-daemon@kernel.org wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this return
> value is not properly checked in the function ast_vhub_init_dev. 
> 
> A NULL check should be added after the devm_kasprintf call to prevent potential
> NULL pointer dereference error.

Please submit a patch for this if you feel it needs to be fixed up.

thanks,

greg k-h

