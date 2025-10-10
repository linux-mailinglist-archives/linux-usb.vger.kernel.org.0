Return-Path: <linux-usb+bounces-29119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF23BCD44F
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 15:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E6E44E7007
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571651EB5FD;
	Fri, 10 Oct 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lbLk7VQi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HPaZfSD/";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lbLk7VQi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HPaZfSD/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DA34BA3A
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760103065; cv=none; b=W9wBoLArdAJJeST/JAKMjyrNZ0lUiGCiF+o/7voOuD5EjV+kIKAZBDrRz1z8FxxCrYn4zaCkayw8wxcNfH0lL55182Llcc2acHwzF38F8xfJfJYhvNrShPkbtKw1LcaUu+zH36U02GpJt+Edt1Wk8QyT+WPEgN1wk4zOAxgyT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760103065; c=relaxed/simple;
	bh=aA/rj5RZC0L74RPMhJIPmgEiz88pF03BwXQ5rV2DDNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2SRKfHB8kbTKFRLb62bPHjai2MEOMvcnQpmNp2nWrmKccVl8fm4Jdm+0T/7th8TeRynJ56TEXTgxbP2bf9lqFUM6rqZLyetdFjD+8rzE9WYybF+5BbL4KEFmn33SDyaDcU3cbxmOJ/VihdCJVvoSNhY4XYCuFhwe7sY0zbr01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lbLk7VQi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HPaZfSD/; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lbLk7VQi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HPaZfSD/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from lion.mk-sys.cz (unknown [10.100.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70DC821D3E;
	Fri, 10 Oct 2025 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760103062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yhXLNrgpSXmdp+PACEFjEsmU14L6C9la+MOSMcbO43I=;
	b=lbLk7VQii3+KnW8s1ERdQaz61RklIGb5C4YU9lmr7FaKes6qpOD8QwsHYrAly5u1SDftwm
	CgT7Kzfqy3bH4YzUcklnOiE/JDtkTyyHzqRFHHkxYg5ZlR2Rp/ASvLzQ9SdJiZSF2Gx1UK
	merst1RtkLYde8DLwWIH6EqoVYqIezk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760103062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yhXLNrgpSXmdp+PACEFjEsmU14L6C9la+MOSMcbO43I=;
	b=HPaZfSD/+Ke7v/t6g83g04WK2EBY2T/Yyd6kgQTSvW2tz7mrGSAUbbZ6DWD1rVJf0smFwq
	YMyoZM3cCwfXjNAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760103062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yhXLNrgpSXmdp+PACEFjEsmU14L6C9la+MOSMcbO43I=;
	b=lbLk7VQii3+KnW8s1ERdQaz61RklIGb5C4YU9lmr7FaKes6qpOD8QwsHYrAly5u1SDftwm
	CgT7Kzfqy3bH4YzUcklnOiE/JDtkTyyHzqRFHHkxYg5ZlR2Rp/ASvLzQ9SdJiZSF2Gx1UK
	merst1RtkLYde8DLwWIH6EqoVYqIezk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760103062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yhXLNrgpSXmdp+PACEFjEsmU14L6C9la+MOSMcbO43I=;
	b=HPaZfSD/+Ke7v/t6g83g04WK2EBY2T/Yyd6kgQTSvW2tz7mrGSAUbbZ6DWD1rVJf0smFwq
	YMyoZM3cCwfXjNAQ==
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
	id 46C3020057; Fri, 10 Oct 2025 15:31:02 +0200 (CEST)
Date: Fri, 10 Oct 2025 15:31:02 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, 
	Nick Nielsen <nick.kainielsen@free.fr>, grm1 <grm1@mailbox.org>
Subject: Re: Regression - commit 719de070f764 usb: xhci-pci: add support for
 hosts with zero USB3 ports
Message-ID: <f253rx26ka5chermdvaia4bpdr7wutyvom67otfjzs6f43wp4x@zie3vvprwpey>
References: <20250826100416.207129-1-niklas.neronin@linux.intel.com>
 <lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl>
 <fa978117-a751-4c66-aa87-adaf6cfc6a11@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa978117-a751-4c66-aa87-adaf6cfc6a11@linux.intel.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[free.fr];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,free.fr,mailbox.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Fri, Oct 10, 2025 at 04:24:20PM GMT, Neronin, Niklas wrote:
> Hello,
> 
> Thank you for reporting.
> 
> A fix has been proposed in this thread:
> https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
> 
> The specific fix:
> https://lore.kernel.org/linux-usb/20251009142911.6069c164.michal.pecio@gmail.com/
> 
> Best Regards,
> Niklas

Thank you for a quick reply. I'll test the patch on my system.

Michal

