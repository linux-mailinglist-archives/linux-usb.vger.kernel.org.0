Return-Path: <linux-usb+bounces-24622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C082AD205E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 15:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50423188456C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 13:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86D9259CB0;
	Mon,  9 Jun 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="r/tJo3/l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54E13635C
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477427; cv=none; b=THtnLffcoWmI7+1EKJjJYYCXbL6lf+2io42faaAZDSnK7uTNHYk4FsCOQ2ojncZbuAWO+fYTZG/k+CaD9N0CplbGLXg68Ak48s3mvhOFZukYLlIm4qRh+DM/KwIqumeBel5JrWUEvGmHdmQqhiubBBAwv4xikm3pV7YIgtkIuPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477427; c=relaxed/simple;
	bh=YBFSexhUOkEouSh7RKW6MTPhUxDiCL0aNF4x8OABeRY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rl4iiAYcYDeO/1DciWiSgNbDsk8iaC+Y7blOru4hJVe9yunskxiJObTlG0liLc3xzDn7xlKoQQ8qwlEzEMsweoWcgH8yo0TImgiBcihahjaOnLbrEQI+cTKj3jPd7SKnvuIxkcpVvoxHeVxZqiELnAgC6iSihZh3olhEbLEXb28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=r/tJo3/l; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d38d562a55so173729385a.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Jun 2025 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749477425; x=1750082225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYx9A3gzkNusqreOQVdEyO5G+prJ2lACwhXai3B0Zis=;
        b=r/tJo3/l7T8QJUtCk8E4nSJ6E4hxqJrJutu4tPDHNVVpVYbCtJdW4S2E2a9BTWzh13
         zo48N+m8El6LGd9UMNRNI6v3hKBR4SgeztNvMXNxsbTKs9BcWQHkIIHQC5bHBQIAeKhm
         K+o/6N2tPnTFwVbk2+ZrYwC2/hcfKQcHKsQcxq1CwffAigYpv0IorEQQDNCOzH4zqsWL
         iWjpEBbSLY1+QBJtoCE3GF4YGzJREOHZvte+fPkIJPSZO7ovEPRK1YkFIpP8H6wDsLP4
         9ggnWZ+xHr36aZqQGpeNmOdG6d2gLzG6/FwTk3SCe0M7MH5IR6xShQyY29iTOee+ne2x
         H7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477425; x=1750082225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYx9A3gzkNusqreOQVdEyO5G+prJ2lACwhXai3B0Zis=;
        b=hLCOHSZdGqfsD2BJ3WNcogb2z64a8b5FTrvMGSiVNf8cqxLZHezL6NBH5Qc8pFuEy+
         KnXgxdlstOoSSw5Lzt/GpYFrB7BGPDFLi8s0FOzKn7jYik+s23B4gjUx4bvkzVQvhLRm
         dGljw/gYWnEswv5BAUtLm102qOlP7m9yXND8oGPZWxV1KPXW/npRu1QBZsSsZypSsynw
         SXWkyCdH5W68JkuVvaBtZDWEoMZrANWqnDnkdYv9iJuRChOdSy4ZiYN28KibkLdFumMl
         1gUBvTHfStBxpjSRfLBU2IRzfl+/He6bxZ+fYCGPk1mzYYahVfdVKcV2ULScJQq0EvW1
         qmbA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFxk9piJKR0nZFKyv4AzWunJ3bhc0+p+FmBCBNkKOLtb8DZRjbxgkvUgRTgdIo5YYtFHGTnPmV8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhvANqmIL3wP0z4ssuApgnN0fd/oqEHYyPpQtPMP80EuzNShff
	wL743n40/ueiSzJbjBYq2a8pBAwsEYWl4dyqr4o+2R0bu4fyfWOF11vM2kcJd8fXjQ==
X-Gm-Gg: ASbGncvmUw/k6GVV0J7uRbO6DvhJasSXpHWMuVwiCspNcEDysNYbx9BJrKqV7en4z+D
	ynARmNqKuUG09JHLgBkavVDQNKCDl97wRsosIQL8ibDLQpnx64AedL8bwSWLtADE/skof3vYDCZ
	ngp5xek9vxbKFPDRa42sR3E7bp68kR2dtuS48/wA/DC/fdkwC5Ui3pHSYrDD/IQlJZOK2kB8xXB
	Sz2q/XEt8SmotaOkk4Pximd5NXUDRJPwcmxQQBJ3mReJtufu9mVsXLxe8luYZf1YVIuFY/lBqaB
	JjwIjQ5DAr92k40ZnAZKZq4JbvH3YXuc0UErUxECh99/6sR88dF1DtKdbMaAZHup2z/a2w==
X-Google-Smtp-Source: AGHT+IEN8w7qJR1SVWmJSoWPT8dkDPpWvoNnB0WOYWLljZ/pbgx7wTL/m+GcB+DkyqUj+gpNQaaRjA==
X-Received: by 2002:a05:620a:471e:b0:7ca:f41a:546b with SMTP id af79cd13be357-7d2298481c6mr2148530485a.6.1749477424648;
        Mon, 09 Jun 2025 06:57:04 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a61b7cesm548272685a.78.2025.06.09.06.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:57:04 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:57:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: hub: fix detection of high tier USB3 devices behind
 suspended hubs
Message-ID: <8541d1a3-15e6-4253-a01c-af02a58869d5@rowland.harvard.edu>
References: <20250609122047.1945539-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122047.1945539-1-mathias.nyman@linux.intel.com>

On Mon, Jun 09, 2025 at 03:20:47PM +0300, Mathias Nyman wrote:
> USB3 devices connected behind several external suspended hubs may not
> be detected when plugged in due to aggressive hub runtime pm suspend.
> 
> The hub driver immediately runtime-suspends hubs if there are no
> active children or port activity.
> 
> There is a delay between the wake signal causing hub resume, and driver
> visible port activity on the hub downstream facing ports.
> Most of the LFPS handshake, resume signaling and link training done
> on the downstream ports is not visible to the hub driver until completed,
> when device then will appear fully enabled and running on the port.
> 
> This delay between wake signal and detectable port change is even more
> significant with chained suspended hubs where the wake signal will
> propagate upstream first. Suspended hubs will only start resuming
> downstream ports after upstream facing port resumes.
> 
> The hub driver may resume a USB3 hub, read status of all ports, not
> yet see any activity, and runtime suspend back the hub before any
> port activity is visible.
> 
> This exact case was seen when conncting USB3 devices to a suspended
> Thunderbolt dock.
> 
> USB3 specification defines a 100ms tU3WakeupRetryDelay, indicating
> USB3 devices expect to be resumed within 100ms after signaling wake.
> if not then device will resend the wake signal.
> 
> Give the USB3 hubs twice this time (200ms) to detect any port
> changes after resume, before allowing hub to runtime suspend again.
> 
> Cc: stable@vger.kernel.org
> Fixes: 596d789a211d ("USB: set hub's default autosuspend delay as 0")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

