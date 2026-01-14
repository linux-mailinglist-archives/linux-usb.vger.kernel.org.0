Return-Path: <linux-usb+bounces-32308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57291D1BF1C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 02:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CA01300A349
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 01:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443E62DC764;
	Wed, 14 Jan 2026 01:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERAGjx5q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C152BE647
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 01:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354481; cv=none; b=Aq2SJP3r9SAnKs2pnY/asn+6CUa9uIzlMzpjpo/SYJDdja+utnH521m92H8obkVTim7JsaGhPzQfmVYYEQAiA9z+c0ybQT18O6x7mSrNFFDhI3YDlX/Dy7/Q6IkpCQW4nFAyjpaGa04JxYmuURvst9BzUrKlO6yIv8M/eyN4xCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354481; c=relaxed/simple;
	bh=WHLrqW3MDSSUywOBnQVpRoXThCWxnHwXQBkWWVjp+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4bMlPfXNSJbxN22h1JfZYTrnkFjkSwH3eJG3NWw+V97zupiNPEGFNHDVLfjvZAmllAMYh4CJNrTxjEkYaPLXzkKZZaa+QZ7HiVeIBzmq7xWj4L0Vh+NGzOcYKoTr/q32h+r4yGLXLiImpGCpLoyOqqykHoutlxEvkBviDp78js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERAGjx5q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73397C116C6;
	Wed, 14 Jan 2026 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768354481;
	bh=WHLrqW3MDSSUywOBnQVpRoXThCWxnHwXQBkWWVjp+n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERAGjx5q1/yn+LUHVf+BWLoLA6mJ20hS2AGyWYKh+R65CihWDkYIQWDkxxjviDDjc
	 PVbQYK0KFcoibnEmkZRc0qPyEZisSM7/oZ1c1ZPoFac8cuU02jyhJJpC9ro1vqYnoo
	 xZjFOaKc6w3fjmLrK8wphJy6KIAI3uguX/wiLyae3Df/DqA82k4F7tiLOCLPX17+1I
	 iTXDnjHw1R+7ZKxq8Yo7RyxDRUQVWWhTXu7N07TBRlhJxdsxC52V4jN6cnz3VZWqol
	 lmuPs0D6xfBwNr/E8/zdnU9Lv7IhpvKTKlBY756oNu6gq9p/LIX2hUuF9rlfMtjJbO
	 Diht3Up4AEruw==
Date: Wed, 14 Jan 2026 09:34:35 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: PETER Mario <mario.peter@leica-geosystems.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Message-ID: <20260114013435.GC2295746@nchen-desktop>
References: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>
 <bc08faa5-9089-44f6-8c7b-236a47aabb0f@rowland.harvard.edu>
 <28460ab0-02d9-4e19-940c-519c0e97440b@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28460ab0-02d9-4e19-940c-519c0e97440b@leica-geosystems.com>

On 26-01-09 11:57:17, PETER Mario wrote:
> On 1/8/26 17:12, Alan Stern wrote:
> 
> > On Thu, Jan 08, 2026 at 03:34:58PM +0000, Mario Peter wrote:
> >> Switch to autosuspend mechanism in ci_otg_work() to prevent race
> >> conditions during rapid device plug/unplug cycles.
> >>
> >> The current implementation uses pm_runtime_put_sync() which triggers
> >> immediate runtime suspend. This creates a race condition when a USB
> >> device is unplugged and quickly replugged. The controller may suspend
> >> before the new device detection completes, causing detection to fail.
> > You should be aware that this change alone won't prevent race
> > conditions.  They might not occur during rapid plug/unplug cycles, but
> > they can still occur.
> >
> > Consider what would happen if the device is unplugged and then plugged
> > back in a few seconds later, exactly when the autosuspend mechanism
> > kicks in and starts suspending the controller.
> 
> I tested this scenario specifically with my automated test setup,
> including plug/unplug cycles timed around the autosuspend delay of 2
> seconds to provoke exactly the issue you describe. I was not able to
> reproduce the detection failure, which does not mean the race condition
> doesn't exist - only that it may be harder to trigger or dependent on
> other timing factors.
> 
> > The real way to fix this race is by ensuring that device detection will
> > occur in all cases, whether the controller is at full power, suspended,
> > or in the process of switching between the two.
> 
> I agree this would be the proper fix. Do you have any proposals or ideas
> on how this potential race could be addressed?
> 

Hi Mario,

Since you have enabled runtime PM for chipidea core, I assmue your SoC
has designed wakeup logic for USB controller or you have non-USB external
events (eg GPIO) for hot plug, which one for your platform?

- If your platform has VBUS wakeup logic at SoC, you may enable wakeup
at your glue layer, it is later than chipidea core's runtime suspend.
If VBUS change occurs before controller goes to suspend, you get normal
vbus change interrupt, else, you get an VBUS wakeup interrupt.

- If you use external event for hot plug, then this event will not lost
because it is not related to controller's suspend, unless this event
itself has debounce requirement.

Peter


> >
> >> Replace pm_runtime_put_sync() with pm_runtime_put_sync_autosuspend()
> >> as recommended by Section 9 of Documentation/power/runtime_pm.rst.
> >> This updates the device's last_busy timestamp and delays the suspend
> >> until after the autosuspend_delay period, allowing pending device
> >> detection to complete. As documented, this approach prevents
> >> "bouncing too rapidly between low-power and full-power states".
> >>
> >> The synchronous variant pm_runtime_put_sync_autosuspend() is used
> >> (rather than the asynchronous __pm_runtime_put_autosuspend()) to match
> >> the semantics of the original pm_runtime_put_sync() call.
> >>
> >> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> >> ---
> >>
> >> Testing was performed using a scripted sequence with a relay to simulate
> >> USB plug/unplug operations at various timing intervals, verifying that
> >> devices are consistently detected after replugging.
> >>
> >> v1: submitted (https://lore.kernel.org/linux-usb/zuzsjr6isq6i5izw3rkyo45opyikiqjmy5xk7flpmlgmqb6mgh@rpbdvi3s4u54/)
> >> v2: dropped redundant pm_runtime_mark_last_busy() call
> >>
> >>   drivers/usb/chipidea/otg.c | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> >> index 647e98f4e351..d19c27f44424 100644
> >> --- a/drivers/usb/chipidea/otg.c
> >> +++ b/drivers/usb/chipidea/otg.c
> >> @@ -230,7 +230,7 @@ static void ci_otg_work(struct work_struct *work)
> >>                ci_handle_vbus_change(ci);
> >>        }
> >>
> >> -     pm_runtime_put_sync(ci->dev);
> >> +     pm_runtime_put_sync_autosuspend(ci->dev);
> >>
> >>        enable_irq(ci->irq);
> >>   }
> >>
> >> base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> >> --
> >> 2.43.0
> 
> 

-- 

Best regards,
Peter

