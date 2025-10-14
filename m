Return-Path: <linux-usb+bounces-29271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F10BD72E9
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 05:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BE0619A078C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 03:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E392303A28;
	Tue, 14 Oct 2025 03:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MvcSFGXm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6D1F4297
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 03:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760412293; cv=none; b=izgP6pQTZ2uD5II86tGtpZ+897dGUd+MK8FYKX2W9s+EZUr/5lk+OyPzr4V1Dtx0fEJjNbpvZ3kqFaScv+f+6NW+pdm0n47frQ16cQUVBMe6fdeQoNIpEM1u7TU+UljvfOzLzwRh7ZeApsbiG9WiRVz2nx+snv1/ov3DrjotfvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760412293; c=relaxed/simple;
	bh=wQL5zY/UYafUcd5NRW0iFch40oKFX8Y9K/L5L9dV3wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDaHM0PHQny/B0bO+qgm0+mGQk422+jfIYcJY8WDCjSABhrIwo9uhWXIw8XCo5BSvpWUIUb/Bf3OGFPqBKvbbpDAz+d8CnIBCGUQPNDov0p0LtsViS3a7HkEdEc2lvPXPVSVBR6C+rOI7Yl6dFCbH/yy1Py/g/81Z0mgAUvdRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MvcSFGXm; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-816ac9f9507so755042085a.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760412290; x=1761017090; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2eESoeI7t+6CnCauxOYAditxQ8JQAouNdEK4b9YgRok=;
        b=MvcSFGXm+BO48+jNpKeI5doWWm58WD6hqHi4igrvOquX8QKZp7E+GTA+NmQw6tJMhw
         dGneZTJaXQwqyZHP1f9ygfaWaEyqLItr0eLAVqblZpUK3iw0XJnFVHYgxk4MVQrXLQtM
         T5GFlazA/LfcGhNKioy2NBM71NcP+QIr2zC7Ho6NzPdCcM53PvQRxz8g9VD4zSuAEvy3
         9PZ0A5EtFJGuK9Tgv8fqKoWr1rD76kBVO99GQpdzkAjZT80Jom6CdbxG7kA7YCCQS2vX
         +mvS9iLHMA2FjGVBumGmIOIFWz3XxXCWkjyVbKNFKsInRFJgKU6XS2zQa+/E//HI1nJQ
         ik3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760412290; x=1761017090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eESoeI7t+6CnCauxOYAditxQ8JQAouNdEK4b9YgRok=;
        b=KUq36H/LDQcZm+CIbie0+NnHi03xm/ulWvJ5EdqhhkEvtK2Onizbm3nFLgb/lFEDe9
         zF/bgtLDky69EYBMp/8JDbEDnGBLZykyQKhGJBDGcYZxhHEd83L4UEFYqcJ68oocGXUs
         ZzrEFP8EVYzC1NENdOJGVB4K/P1fNCPWaSl/sYAcCQs96Yzcj1MfZF0z/H+DbuynVLax
         O8c0n4pxREiVKNTpyzbtpUlKWEdFpt26qGhYk0P5HYVI4YZ+AO1AednJ7t4czlGrTPTU
         7ZCDnjPVB2KbvLetGPdT14vZxa4wO3f7CDKooYZiBAZuHkscEzcOyDkasrqE8iuk7VQE
         EVag==
X-Forwarded-Encrypted: i=1; AJvYcCXMi5X02X7gGDIl4FSAPdPZjnYOYUpZH40+8Q6BMBphJlbS60yBU6fkVnK5JrO9nFTd+GZhnxcRBk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAfRWdNAH10Nrl/O/zljrzcLJbekj3+Kn09ENjzNegxFOLOft
	LpZvgaYBIQwDgcErIzciFVn/1NlJ/6d8UXxJMEztetF9GN4rO2LBKsf5hOQMdiVfOQ==
X-Gm-Gg: ASbGncu952uXPMseuc7Ed7GcVZbA5MRp7d6BfsYGVLGxtdfRcP8Kdj1B9b9Kyxla1zQ
	w52BCv4Lz3Jr/oypBln27lUMBis5dERk9K4ssFnRdKZu4ZAXu6YtIsSrXXJQ4UUUCEsBy1AK9iH
	SYx8eoM+UqkJtoF2fuxcbLhwZAJd9n7HrF9oo3r//ZrjLYRS4gik9s5dObq3GF5MY9g6Cm1oO2d
	qumoMkPFcTEVNyf6+XUo7IKeRrffbsOPNpGVzth3lViYPx+b4/amwz8n6KEByb93QL+sPLh+unL
	kGTcUtL7U41bquqMMOBJx4e/SJ9kP5zyW/f4NpC5ixnWD8p5KiJR+eQSafG25XUCK+Wg8oUZU4s
	uAgEIlDvIqp7II1h4YOeqmqnnp8XdMikPeVCNvSq9dW7VmD953Gr8Jw9Fwz8=
X-Google-Smtp-Source: AGHT+IE7gll1slBbCLMRKl7QMqjWWFVjibZtwECN1/xgLx+WXONOp6Bwt8jaNLj8ynQmvDV6y6cs3Q==
X-Received: by 2002:a05:620a:1a8c:b0:851:979:8205 with SMTP id af79cd13be357-8836d742a72mr2726428885a.1.1760412290156;
        Mon, 13 Oct 2025 20:24:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::9c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2369649sm1133395185a.49.2025.10.13.20.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 20:24:49 -0700 (PDT)
Date: Mon, 13 Oct 2025 23:24:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: core: Add tracepoints for device allocation and
 state changes
Message-ID: <3d4f625f-eecb-4265-ac86-1420d646aa14@rowland.harvard.edu>
References: <20251013-usbcore-tracing-v1-0-b885a3121b09@google.com>
 <20251013-usbcore-tracing-v1-2-b885a3121b09@google.com>
 <66a98159-b75c-41f0-8b4d-0ce9b1c8e4ec@rowland.harvard.edu>
 <CAKzKK0pzfSFJ15esnGB9gY_HMrgubZ1QtSkLOUo2FvsNGtCi6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKzKK0pzfSFJ15esnGB9gY_HMrgubZ1QtSkLOUo2FvsNGtCi6g@mail.gmail.com>

On Tue, Oct 14, 2025 at 08:05:25AM +0800, Kuen-Han Tsai wrote:
> Hi Alan,
> 
> On Mon, Oct 13, 2025 at 9:20 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Suggestion: Rather than printing the meaningless numerical value of
> > __entry->state, print the string value returned by
> > usb_state_string(__entry->state).
> 
> I kept it consistent with the udc_log_gadget tracepoint, which also
> uses the numerical value for the USB state.
> 
> If we change the state to a string, should we convert the speed field
> to a string using usb_speed_string()?
> 
> I lean toward keeping both as numerical values, but I am happy to
> switch both to strings if you prefer. Please let me know what you
> think is best.

I agree that if one of them uses strings then so should the other.

As for whether you should change them...  I don't care very much, since 
I haven't used tracepoints in my gadget debugging.  I was just thinking 
of what other people might like.

Greg, do you have a recommendation?

Alan Stern

