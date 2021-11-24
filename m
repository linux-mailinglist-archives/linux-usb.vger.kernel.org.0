Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FF445B809
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 11:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbhKXKKi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 05:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhKXKKh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 05:10:37 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D470C061574
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 02:07:28 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id b125so1119577vkb.9
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hjJ6H/aPkDXkuuq4jQBlpPVE2plVHVx9/+2fQcYfz/c=;
        b=DxM3mTOrIbFQo5PJvMRYGAQ7CLl6GOzG4UFrLAqZGx1/QeWkCA3jy3rnxwe6NuJuVn
         BGtgvFgk7Uh2l3Z6WHPBNu6NVNRtmBC40TEe/lNTXz2cFS2PCtMdsF+BQ44xddybuqOW
         xl2RDQeLvuRxJzFjyG+1vGL6HFfcqW14sb406F0+ftbPKd31ahK92/KsJlAIhSsa5SfE
         Ylq9vDUhfTseWn9ap7Lnl8RGnVUmEZFng8D73PaeYQrzh6lHH5PMM563fPobtbKk+9x8
         qub6HvI6gj44GyTccZSpUuw+OdTEuZZqJG7e91vqetzpd4InshiKwaNeu90mvnWdY7b8
         +jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hjJ6H/aPkDXkuuq4jQBlpPVE2plVHVx9/+2fQcYfz/c=;
        b=vmNysvmEWX/jtgZRD/RFX+VnVy1jzYuEeeaGlg3dZjlJa1ggEbGbFLxgxCAvKrDhhl
         VoreyhrXuJ9LJrVPQa/ivCklCWLiWM3Lgrs/x2revXJcOgRp6PuYQK+vk3I8BkCgIn55
         ENLaQbpu/bGy7SGjiUdLDd+VhLVXlfk+HVLKTuVXLFDJKwekxayfDBnUUeVze8aX4FSU
         kMHGT6yencc7xI3+OVbsfN6NRMFmQ+IHHvOrkZNht6Lf1mC6fzI98Z92nuZKU89SvcG7
         Srl7zNud06F+MxgEau5RA1MHi3A/eNY1WJvakv+3hNR3nceGU/LovghiDpfULaZWsn6r
         YfIA==
X-Gm-Message-State: AOAM530xrN1i6W783iSz5j9Ls/LOSd6b0v0WkjDYGzzHdO5X6WrF7QXz
        XIOrvUCIrJ6XltZuGxgpq68VFV2FknXVTjFqZBLhCRR0U/8=
X-Google-Smtp-Source: ABdhPJwDOUAH6we0c7aRDNRW2ewF5lx55/F2CZq1gIeBZqpep1Fk8iWKBGLFh/Qn94bNIPCHIg270T+4V6NyBUKCPwU=
X-Received: by 2002:a05:6122:997:: with SMTP id g23mr24692646vkd.15.1637748447080;
 Wed, 24 Nov 2021 02:07:27 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
 <YZ3j9XKE0WjfkcsI@kroah.com>
In-Reply-To: <YZ3j9XKE0WjfkcsI@kroah.com>
From:   Jupiter <jupiter.hce@gmail.com>
Date:   Wed, 24 Nov 2021 21:06:50 +1100
Message-ID: <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
Subject: Re: Kernel 5.10 USB issues
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Greg.

> That is usually a hardware problem, the kernel can not disconnect a
> device from the bus through software.

Understood, that is why I used the same HW to test both 4.19.75 and
5.10.59, that should rule out the HW problems, right?

> But, if 4.19 is working, can you use 'git bisect' between the two
> kernels to find what caused the problem?

My bad, I have never used git bisect before, a quick google search did
not help, the following command does not make sense at all, what are
right commands to check 'git bisect'  to find what caused the problem?

For 4.19 kernel
$ git bisect start
Already on 'linux-4.19.y'
Your branch is behind 'origin/linux-4.19.y' by 13117 commits, and can
be fast-forwarded.
  (use "git pull" to update your local branch)

For 5.10 kernel
$  git bisect start
Already on 'linux-5.10.y'
Your branch is behind 'origin/linux-5.10.y' by 2311 commits, and can
be fast-forwarded.
  (use "git pull" to update your local branch)

Thank you.

- jh
