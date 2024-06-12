Return-Path: <linux-usb+bounces-11191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C9E905257
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 14:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F8A0B2109A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 12:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4162916F829;
	Wed, 12 Jun 2024 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H7iOZCC4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8CC167261
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195062; cv=none; b=mhjBVx2fycQ6Z7gwQFWFH2+d1KGZGundfQy4M2zJJkdm7HWRoF8yIx6Dz7UFEEoPmk66pv7a5eXkwFGT7sKzK1oyKL3Tr/GCIdb27jqSx2pRqdSTdgYWYxOo9V3SD7VgGQ5STnGeQhVW7wIsLrRc38wLV/KHW7YMMV705iG9wSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195062; c=relaxed/simple;
	bh=oR3H2MSoj1GxmvkuqTjfVTUakz6WuiZNnWLsPyZARGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QC0uIMV2RjUNoHyAPxCxT7smXEbnIwFYNdC2oTsdzwSo4SjQGpYR0xq5erWfzpAUhVofC+bv35SZj1vS/tynkaq1yPv3lYMxX6kN7665COoeAQfaamlGK8CaF7mcLT1J1F72JYr8Eq4ZSC7F0f4rXUsxjvA+kUvsG/qubYMnRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H7iOZCC4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA13C3277B;
	Wed, 12 Jun 2024 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718195062;
	bh=oR3H2MSoj1GxmvkuqTjfVTUakz6WuiZNnWLsPyZARGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7iOZCC4HrJdS5R40vpRvED0fYMgQ04xFrHJJOteD0m2zPz9IwIu+tzxm52wKnR2t
	 exbGhxiNtPwtk0Cr5zCDWCuyGuXc9iB4L7yyWQhFnqE15w2GkBWGCdWnF1AJiATLeH
	 k3hov3QlTjTGB+VOyxwH6rzm779FWcVVwk7yZzmc=
Date: Wed, 12 Jun 2024 14:24:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Smirnov <d.smirnov@inbox.lv>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Re: [PATCH V3] usb: mos7840: Fix hangup after suspend
Message-ID: <2024061241-washstand-baggage-5789@gregkh>
References: <2024061214-concerned-retention-a91c@gregkh>
 <20240611172311.2498-1-d.smirnov@inbox.lv>
 <566070497.245859.1718193638009@w4>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566070497.245859.1718193638009@w4>

Please don't top-post or send html email (the html emails are rejected
from the lists...)

On Wed, Jun 12, 2024 at 03:00:38PM +0300, Dmitry Smirnov wrote:
> Do I need to resubmit as V4 after the fix, or just can attach a new version to
> this thread?

You always need to send a new version, otherwise how can we apply it?

thanks,

greg k-h

