Return-Path: <linux-usb+bounces-31706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C9ACD98B3
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 15:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCF0730028A1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0C3301477;
	Tue, 23 Dec 2025 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/+GYpMT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3612F1FE7;
	Tue, 23 Dec 2025 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498692; cv=none; b=SoZS/XdZyKepUSL8ZINAfqLnBnHZRULY8SvPVCY0D45DgwEkuL20FZns69AYG4gLO1oz8C47S2ogjMfSxdQGhDTHq6e68KtDMoRXDhEIHr0FbkFz/KotvC97KFOz6TS+VRDzGdX3zfEVhYoN4wbiKjgpVqdppQneyZBbYryald8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498692; c=relaxed/simple;
	bh=KAHJTCfRlqUI9i69fwxv+R9DVsyPs2rX6yXSfLqInEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7Z5dkSorpBxFCKfJfU2gSdYfzGhRpBbliED9hGhBQU7bSBa9s/Hk5kyXmophY3fcZPiTDgQFFdIQ/qyYrVwHNZlMCOpB326IKqnhjMtbdapEDrXqpmk4WWuDm6SENyYDvVpbBNLhRdZTPO2F9gv7LsOy37FytLxqonakZEpJps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/+GYpMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC88C113D0;
	Tue, 23 Dec 2025 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766498691;
	bh=KAHJTCfRlqUI9i69fwxv+R9DVsyPs2rX6yXSfLqInEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/+GYpMThmZ1gueKx56b9eiKGDSg9wA2h4wOM5iH7Zyg888AySfX6NeVCbtp75lz0
	 x2o4EYaL+C4pLI3+SqOW+ttXD7V1+Ozp+jOjj/goQ8blBHkhZuMKgRjEG0bp1SSMU9
	 flHdo43pqe9WL97U5vWDDf0wNtC0urRiafqw1OTgUrQVJHgjdA6VO6xmJ8oJ2I22ma
	 yN+57pq351soxUtBbEayIbO7b8bicCeBPWor0umws0oz0Wlruj6699mwZ4Q7FaznF1
	 DDdrJNkjQc8BRYnWHTdShMUKJgglWbblXS0FQHyICIE3k1zPcVAB2Uy/r9bLbXCRVV
	 5l+pfrDpPao4Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vY30L-000000002ou-1uOC;
	Tue, 23 Dec 2025 15:04:49 +0100
Date: Tue, 23 Dec 2025 15:04:49 +0100
From: Johan Hovold <johan@kernel.org>
To: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: typec: ucsi: revert broken buffer management
Message-ID: <aUqhgbxGIbq_V9Cz@hovoldconsulting.com>
References: <20251222152204.2846-1-johan@kernel.org>
 <a6073f4f-edb3-470c-be63-4c3054d497a0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6073f4f-edb3-470c-be63-4c3054d497a0@linux.intel.com>

On Mon, Dec 22, 2025 at 02:15:10PM -0800, Katiyar, Pooja wrote:
> On Mon, Dec 22, 2025 at 07:22:00AM -0800, Johan Hovold wrote:
> > The new buffer management code has not been tested or reviewed properly
> > and breaks boot of machines like the Lenovo ThinkPad X13s.
> > 
> > Fixing this will require designing a proper interface for managing these
> > transactions, something which most likely involves reverting most of the
> > offending commit anyway.
> > 	    
> > Revert the broken code to fix the regression and let Intel come up with
> > a properly tested implementation for a later kernel.
> > 
> 
> Thanks! A fix patch addressing the race condition has been identified and
> is being tested right now. It will be submitted for review shortly.
> 
> Here’s the discussion on same - 
> https://lore.kernel.org/all/349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com/

Yes, I'm aware that discussion and I still think this needs to be
reverted. Then you can propose a redesigned and tested implementation
that we can help you review as that kind of work is not something that
should be done as part of rc stabilisation.

Johan

