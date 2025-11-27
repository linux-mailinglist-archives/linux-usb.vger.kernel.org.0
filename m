Return-Path: <linux-usb+bounces-30989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EEC8D518
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 09:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0323B346C17
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 08:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8296331D374;
	Thu, 27 Nov 2025 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vdGIt18q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DA2DA755
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231757; cv=none; b=aBe2uOHLuzBnnCU6KtVpyucvg8uXJU2rUzQDQGbX4DikzwPV3jTWnLZNBVnOcyNe3eUAX4NUsOwzYynZxcKqOBbZHwXxbOQv3J6TkU6AdPHXGQHy612t9UHJTfR/kN6nju0lPKXtNrMOl97xLc9FAUTrFVhFXwYe90+8vn3hoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231757; c=relaxed/simple;
	bh=TCzrZOu3mF5y5LT2LKDUp8hKUotCAzwMbAhLklV6ctI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xu2YDXAmcNqV5uTPvP7/crEAtJlcXjG8ANpuRV7H9SAztV251+hxUx3D01ooJNeQwGNlEEJP55OnIOXdVE4qt8XUiBLAhKzv8UrTUbG3coyvquKxWqY1h75qC9ONC7fi6C8BouXILLnzfFEtPNAMapMRSfphT+GltfDhE8AaKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vdGIt18q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9A6C4CEF8;
	Thu, 27 Nov 2025 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764231757;
	bh=TCzrZOu3mF5y5LT2LKDUp8hKUotCAzwMbAhLklV6ctI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vdGIt18qVgCRSpbOUKbRJT5USxo+JZZfACMatQK8hn3UCLdgdN6Qsryquruujlmx0
	 htzZc6ApTxtHSaSFtX7tzI5IPDjgtjTz0v3BliQPvYFy4JCSSQkY1gTNDbXtrgeKT5
	 BVDqyMwHr1DQ8AmsV0cEigBYIxMNChgow/poYvaE=
Date: Thu, 27 Nov 2025 09:22:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <2025112737-frisk-prototype-f011@gregkh>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>

On Thu, Nov 27, 2025 at 09:06:24AM +0100, Angelo Dureghello wrote:
> Hi all,
> 
> looking for some help on testusb tool tests 9,10 always failing with
> -EPIPE, kind of ep stall. Peripheral side has g_zero loaded.
> 
> Devices under test are custom boards, have same qualcomm 8 cores cpu, and
> kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
> Anyway, connection under tests is 2.0 microusb connector on both side.

5.4 is _very_ old and obsolete and odds are you are paying for support
for that kernel from a company if you are stuck with it (hint, it is
going to go end-of-life in 3 days).  Please contact them as you are
paying for this kind of thing from your vendor.

If you can reproduce this with the latest release (6.17), please let us
know.

> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
> /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)
> 
> usbmon shows for both cases some EPIPE:
> 
> ffffff85bf04b100 1951528285 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
> ffffff85bf04b100 1951528785 C Ci:1:007:0 0 2 = 0100
> ffffff85bf04b100 1951529102 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
> ffffff85bf04b100 1951529554 C Ci:1:007:0 -32 0   <== EPIPE
> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
> 
> ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 2505a0a4
> 04050102 0302
> ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
> ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
> ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
> ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
> ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
> ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
> ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET
> ffffff85bb5b4500 3778249493 C Ci:1:007:0 -104 0
> ffffff85bb5b3500 3778249519 C Ci:1:007:0 -104 0
> ffffff85bb5b3900 3778249544 C Ci:1:007:0 -104 0
> ffffff85bb5b6500 3778249569 C Co:1:007:0 -104 0
> ffffff85bb5b6900 3778249602 C Ci:1:007:0 -104 0
> ffffff85c5b6e100 3778249631 C Ci:1:007:0 -104 0
> ffffff85c5b6ed00 3778249653 C Ci:1:007:0 -104 0
> ffffff85c5b6dd00 3778249674 C Ci:1:007:0 -104 0
> ffffff85c5b6d500 3778249697 C Ci:1:007:0 -104 0
> ffffff85c5b6b500 3778249727 C Ci:1:007:0 -104 0
> ffffff85c5b6fd00 3778249755 C Ci:1:007:0 -104 0
> ffffff85c5b6a900 3778249775 C Ci:1:007:0 -104 0
> ffffff85c5b6ad00 3778249795 C Ci:1:007:0 -104 0
> ffffff85c5b6b100 3778249815 C Ci:1:007:0 -104 0
> ffffff85c5b6c500 3778249844 C Ci:1:007:0 -104 0
> ffffff85c5b6d900 3778249869 C Ci:1:007:0 -104 0
> /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)

Any hints on logs from the device side as to what is happening?  Any
debug logs?  If this is an i/o error, the controller might be logging
something that went wrong.

thanks,

greg k-h

