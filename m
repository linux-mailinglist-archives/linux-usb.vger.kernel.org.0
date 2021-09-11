Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE034078E4
	for <lists+linux-usb@lfdr.de>; Sat, 11 Sep 2021 16:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhIKOlk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Sep 2021 10:41:40 -0400
Received: from mail.msweet.org ([173.255.209.91]:49606 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229643AbhIKOlk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Sep 2021 10:41:40 -0400
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Sep 2021 10:41:40 EDT
Received: from smtpclient.apple (unknown [135.129.115.168])
        by mail.msweet.org (Postfix) with ESMTPSA id 07EF2803B1;
        Sat, 11 Sep 2021 14:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.msweet.org 07EF2803B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=msweet.org;
        s=default; t=1631370692;
        bh=Nk4yW8o7fGfCyZZFbozVwzOS92fZC4GClCHPKEX2E34=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
        b=mhf4SO7OwcrE5pv/RU1dBxzhbHxJCA7grGerRfuvF+XCAmb3MwDBi//ivvqaiYvqA
         ZGFqZoDEH5k2nCZfPI9bQJSZnv+GUXmYIVZS/ruZ5bMNyf71BYfKLL5oKZatmlIbhO
         nEf9XRuV6ccpE79gyepwXvJSTcIS8btkCZzTYjuE=
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.0.1.1.10\))
Subject: Re: How to register a new "function" in configfs?
From:   Michael Sweet <msweet@msweet.org>
In-Reply-To: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
Date:   Sat, 11 Sep 2021 10:31:29 -0400
Cc:     linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE84D77A-93F8-43B2-A952-896D6BED2E6D@msweet.org>
References: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
To:     Ajay Garg <ajaygargnsit@gmail.com>
X-Mailer: Apple Mail (2.3693.0.1.1.10)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ajay,

Quick question (as someone who has been down this road), do you need to =
do a kernel driver or could you just use the functionfs support to =
implement everything in userspace?  I found that path to be much easier =
and less error-prone (and one of these days I'm going to be contributing =
some documentation changes to make some things clearer...) and I was =
able to get my IPP-USB implementation up and running very quickly.


> On Sep 11, 2021, at 1:43 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>=20
> Hi All.
>=20
> As a first step, I have been able to load a gadget on configfs, which
> binds to the function "gser" (thus loading up the usb_f_serial module
> when the gadget mounts). Things work well till here.
>=20
> Now, I have written a brand-new gadget-side device-driver, trying to
> create a new function "gusb", via DECLARE_USB_FUNCTION_INIT.
> However, now when I try to load the gadget for binding to "gusb", I
> get the error that the function cannot be found.
>=20
> Seems that firing up a new gadget-side driver, that registers a new
> function via DECLARE_USB_FUNCTION_INIT, is not enough to make the new
> function visible across the kernel.
>=20
> Kindly let know what I am missing.
> Will be grateful for pointers.
>=20
>=20
> Thanks and Regards,
> Ajay
>=20

________________________
Michael Sweet



