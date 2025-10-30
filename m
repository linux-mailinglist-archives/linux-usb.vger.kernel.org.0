Return-Path: <linux-usb+bounces-29875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4735C1ECFF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 08:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6225A4E879D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 07:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE77337B90;
	Thu, 30 Oct 2025 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J71q979l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53838F9C
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809991; cv=none; b=e5niNCqA4GFWNarTpKkRMIVCCeiDBfQmvw3cZmeaul62jHrTDF5PARpf879KpWNZIULml2Mbc4VEbFPAMZ32OAjUduBRJSbY4GJCSRgDyPcYOTIRdwsryduOAozextzSG0bI3q9fnpuGITYn9f2N4WdbHKxAjA/ga8jO5HWpJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809991; c=relaxed/simple;
	bh=9yUwP4kPaEdJtvr+CvbfQpL6t1OZzYyk4SU6OBUGdEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMEW2LOh5kgOJG1GoIUZpqyK20//YxXqDApA7QJ217Rw67BUOpdEqlQxCpLyH0wKyTxj0iyiMfGnG1c+wfP7AdlAtoZUCEmSmwVO4cPAQn9sAzvD+eHUF54gml6/x21gJh95tAbOWhVi6A5lia4hkm2TP2J/4Xyzz2arPYpqs8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J71q979l; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378d61ce75aso8112531fa.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761809988; x=1762414788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yUwP4kPaEdJtvr+CvbfQpL6t1OZzYyk4SU6OBUGdEY=;
        b=J71q979lDXpcJsnOttVrbrabwoMlFEma8gXf4Ken0UJR1vqSZ2sbZ7CFjd4XF03Sp+
         bYq4VRGwl2gcM5N+H498Za9n3UZsBdJb2h9nO1Va+aYmFGjh1jrNHzP5/91dwAe1ONp2
         jsxKpSjg7jahNFOvXWLpKYLrHBia7y+A85f19cvd7NIEsgUVUmxBlKhTl1QJ56rz9tDt
         m6Pa8nUAc8PCxTIcfbF1/woTy4c9zfhLgLCtiIwRZRSxmiYFbqB3xdcOwjQPQEx38E2/
         98K7ypns9K7zGihzYLey+/wbyb/74TXD9OHN3vnEyI6SeRyy+vOPPWqCTfkH3bdOp5mC
         Wm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761809988; x=1762414788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yUwP4kPaEdJtvr+CvbfQpL6t1OZzYyk4SU6OBUGdEY=;
        b=DTdtsTzh9zVS/P8AEnYBzXgS07QTn+Cse1iWb1tZcB0ktiOe3TfDVWgpn7cjRoB/n8
         dGe1bxCawzeu4MS06+ZxDzieI8/TMPUJAx/I5nTa3gFNmuWKCwHvWsQ+SdTre+gDacH3
         DTUQZgxou3ZRo7ABBgl5c7g6UHyno5KWGn7S34TJJIMibVnoF8LRM8pZ0UXhJqGYrtwr
         LwEp1Eix+cE5XviuE3AuTAFVSnhgsoS+rEcFUBYN8SaSo7HpnovUqhejN7vmn14jUA5j
         6VK+HwVRDp2X9ZgngRKTVhEOGB0I5vY4OYrPxbheZWc1Hnrag1CvG0DGE4Y2Wcq1udLL
         xyxw==
X-Forwarded-Encrypted: i=1; AJvYcCWCpuSA6bmqi0MzUN9uSdGZB1dZx6OgTp1jHU7Tf5/EpENkLJL6pAhv06b5D3b0NrzFzuD00+pKVD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMe9vLJTVdBOjX8yjLbviv1TYnFAUVEJEgNJrPooPCVX2mLgVn
	e1VGZbTGNk3TWdHe3Pnprgd2HkvGXEBSfXosmG2wyRQaCMX+bd2X3BMx3ex3pUlEKLp40ExoBgK
	woYFtBNApYm1WEs9QvuOLEDpI7b83qmRayQaj
X-Gm-Gg: ASbGncvz7p8sGwEYAZ6G1sBlOq4o1E8NE1lA0v/yLNhEvbAn+eFa3/VDfsfioaD/ObE
	vxDI+ByX8qWu+BfTTaZHIlhUDJEIH8nZOAmcEsFjtU0hEE6r4YuKvG05/+D6xuBMvd2XOErez2W
	hQsSaHXRnBsf+lrLwap38dEwFmim213YubKpT1qRX6B15E64xwSlKz7zrvl5AhzO8bDtP0DjChI
	zF+HuWb40Fi0Umq19DfQ+t2b4FnIqAYcNhvcgH7SjMOXCLrKdkYoqXI0B2ZAvKNZ8br
X-Google-Smtp-Source: AGHT+IH6BHlDGGqZl4xNIme+2yx8hI/HaajLMlkoQe14TrQIC5gP9C3O91U5O3c2DL4xU4uQPZ5+4qia2M/Sbh0/beI=
X-Received: by 2002:a2e:bc0d:0:b0:376:3d8c:4df4 with SMTP id
 38308e7fff4ca-37a1067f994mr7577701fa.4.1761809987851; Thu, 30 Oct 2025
 00:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926060235.3442748-1-cryosay@gmail.com> <aO5kBAjE6EMG2aUE@hovoldconsulting.com>
In-Reply-To: <aO5kBAjE6EMG2aUE@hovoldconsulting.com>
From: Oleksandr Suvorov <cryosay@gmail.com>
Date: Thu, 30 Oct 2025 09:39:36 +0200
X-Gm-Features: AWmQ_bkO7lXe1738HDkGrKIyD0Bk06Av-7OCJrogshstT-ALsPGbL9I210oBCg4
Message-ID: <CAGgjyvFATG4PpHrbWV87tqtLeO3zeM_0508wtATrsxw3s06zVw@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: ftdi_sio: add device ID for U-Blox EVK-M101
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Wed, Oct 15 2025=E2=80=AFat 16:36 Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Sep 26, 2025 at 09:02:35AM +0300, Oleksandr Suvorov wrote:
> > The U-Blox
>
> Missing product name?

Thanks, I'll fix it.

> > has a USB Type-C port that presents itself as a USB device
> > (1546:0506) [1] with four attached FTDI serial ports, connected to:
> > - EVK-M101 current sensors
> > - EVK-M101 I2C
> > - EVK-M101 UART
> > - EVK-M101 port D
> >
> > This commit registers U-Blox's VID/PID of this device so that FTDI SIO =
driver
> > successfully registers these 4 serial ports.
>
> Are you sure you should not just register the UART port? Some FTDI chips
> support I2C but you'd need a different driver for that.

Thanks for pointing this out, looks like I should add a custom probe()
for this device.
Preparing v2.

> > [1]
> > usb 5-1.3: new high-speed USB device number 11 using xhci_hcd
> > usb 5-1.3: New USB device found, idVendor=3D1546, idProduct=3D0506, bcd=
Device=3D 8.00
> > usb 5-1.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=
=3D0
> > usb 5-1.3: Product: EVK-M101
> > usb 5-1.3: Manufacturer: u-blox AG
> >
> > Datasheet: https://content.u-blox.com/sites/default/files/documents/EVK=
-M10_UserGuide_UBX-21003949.pdf
>
> The user guide also says "Do not use this COM port" for all ports but
> the UART port.

Yes, you're right, thanks. It's just not that easy hacking the kernel
while defending from russian invaders :)

> Johan

--=20
Best regards
Oleksandr, sr.soldier in the Armed Forces of Ukraine

