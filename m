Return-Path: <linux-usb+bounces-30111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A17C376E6
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 20:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD03A3BDB3F
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 19:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6533CEB2;
	Wed,  5 Nov 2025 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="mqZmqf7c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4C31BCB8
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762369609; cv=none; b=TH10Y3Po+XN3Xeg0+uUkhEFRMN03r4DnD05lz1SZFUXvpy9bwQWsBTqHVEmFPKgD6biIoEnndwWG5wqXjLiB+OZdd5oYD6huelD8ewgAzxIbk+3UoUXJb5WoJ9jb4yc7mmfIe0yf2xQQJ8E6XCVKHkgeQH1xVFKJchowX1QZffU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762369609; c=relaxed/simple;
	bh=B4puIoFSNWu+6U+4OWbGBgnTG2zRjb/6senowI4RSG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcxIPlfWfBKXg0VOgxg9rMhslnzz6prknDRp6XCb5FBxhVLLbb2WdGJeBjU0yFgQx4rojNpgaM/D2J7sA0GrSoI4j9ArK0qR+bjMg8B260uwfvcu47s7wkQbDVFxx+dveoHv1uw+WQ5lYq+cBxIUb0xFQBDBSkLXDXsZdRVjcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=mqZmqf7c; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4d1vv830gwz12qN;
	Wed,  5 Nov 2025 14:06:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1762369605; bh=B4puIoFSNWu+6U+4OWbGBgnTG2zRjb/6senowI4RSG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mqZmqf7cBB16kX6fDFjPqfOlCa8cFUk9ijFmAUaBwZGnKq48I1lYPm2QARqBJDCml
	 xBlVkGlwmkBb7iRTyORFgbsEJUPEc5wFJDQ3xP4cx8n3h8jTpIBXpJizw/yeTS80zI
	 /exx990ieMOcVuZPfcp0le0bGoBLYZOHO9MHtb+E=
Message-ID: <e77b71c0-11a6-4df3-8f2d-412f92c1056b@panix.com>
Date: Wed, 5 Nov 2025 11:06:43 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
To: Mario Limonciello <superm1@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kenneth C <kenny@panix.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com, Sanath.S@amd.com, linux-usb@vger.kernel.org
References: <20251023050354.115015-1-superm1@kernel.org>
 <20251023055603.GU2912318@black.igk.intel.com>
 <02191522-b3f7-459e-ae46-12788f36209a@kernel.org>
 <faaaf1ae-4763-40d6-b734-b2dd0e47b27b@panix.com>
 <1d635632-e51f-4538-9896-3e4fa56a4193@kernel.org>
 <00b5f5a6-27eb-4949-88ab-eb78badedc58@panix.com>
 <848584ae-897a-4b82-8532-059c148db9ed@kernel.org>
 <3aa6006d-450c-4253-a617-bd76114e9ede@panix.com>
 <a849fe60-4dab-428f-a97b-932d597dfc88@kernel.org>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <a849fe60-4dab-428f-a97b-932d597dfc88@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/25 13:21, Mario Limonciello wrote:

> For the purposes of testing this patch works it's probably easiest to do pure S4.

Well, you were right ... the patch didn't (re-/properly) enumerate the 
devices when I'd switched TB docks before coming out of suspend ... :|

That being said, I do "suspend-then-hibernate" AND "hybrid sleep" (which 
I'm about to disable the former as I think that solves an unrelated 
issue I have with "double suspend").

So, could this patch be applied for the coming out of (s0ix) sleep case 
as well? (I swear that used to work properly until a few kernel revs ago 
....)

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


