Return-Path: <linux-usb+bounces-26804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9DDB24C4E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6E41BC0231
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443691E2858;
	Wed, 13 Aug 2025 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sqSaQUSV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7CE3C33
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096188; cv=none; b=CwqhbBtDfnbVQ6Wzdg1Kskxl5/NgYs4w6QjQJ/DOjJIkOsqySYmi0XAqyJpsi6c1nR6BAO+vXDfCB+XJTIzZ2L3r81A1Xd/+Du7e3I8Itr3CasWHePty5t1crj/g71dRVv/5upJ5yQUwu+Lkrn/0hE6q6lJTOY2Ma9WWtL6pZcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096188; c=relaxed/simple;
	bh=bQjmSg2uvnWJteEqi5cJX6ObQmiWkm8nUb4T0Rm9zb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiqEveaN2NgAsnLoGr9+iLT6LyI+MAKYyqpQtr7jlexJEEiZ97/l4QzkrO1vDNProt6VeyiZHXyV26qX5ebeSKAmlPp/uj9Ok/agzAD7y3S5eL/Qf1WEdT8JTL7+Kcif2emngRQ5oXwnEeb/9fuMgxGqzYE0RC+T2jR2DjDTD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sqSaQUSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F534C4CEEB;
	Wed, 13 Aug 2025 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755096188;
	bh=bQjmSg2uvnWJteEqi5cJX6ObQmiWkm8nUb4T0Rm9zb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqSaQUSVPsD+5J8SRkzoT0N25jq/YDM018e6r545se4WvSaRT19cjgr86CIAJzfz9
	 r1yggPW5VpFI6YNRisKpjaxDHheaIPEmox34N1MMYw6QGt6KqKfCDJCMs2v/ydH69Y
	 qTf0/3OB0BAGX8VoILtC1k7TriaL7r8SQ2DdupHE=
Date: Wed, 13 Aug 2025 16:43:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] USB: Check no positive return values from
 pm_runtime_resume_and_get()
Message-ID: <2025081330-droplet-napping-6843@gregkh>
References: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>

On Mon, Aug 11, 2025 at 09:24:03AM +0300, Sakari Ailus wrote:
> pm_runtime_resume_and_get() always returns a negative error code or zero;
> there's no need to check for positive values such as returned by
> pm_runtime_get_sync(). Simply drop the check.
> 
> Fixes: 7626c52b6b46 ("usb: usb_autopm_get_interface use modern helper")
> Cc: stable@vger.kernel.org

If there is no need for this check, why does this need to be backported
to stable kernels?

confused,

greg k-h

