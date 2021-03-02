Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8021532A480
	for <lists+linux-usb@lfdr.de>; Tue,  2 Mar 2021 16:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383180AbhCBKsE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Mar 2021 05:48:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:50858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347891AbhCBHHi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 02:07:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6251664DE8;
        Tue,  2 Mar 2021 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614668817;
        bh=ItaVA5vziWmClkiksaDSYnEouJv6GwojNAFqFBPiXes=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1ODLC2rr+tyH27A8uwjpsYgX8dCBX+SGLrD2fDTTKGcnIi6fhghRHzRa9F2CEw+xv
         FUIUZ50OtS98ymF1A+/5H41qbv8iRVhp1T54wt3t5Hb6rionc05fPS89iTCzDOjOrW
         l1gvFUwhdpfTCsPdRlqxPlh4mMqIO7ahMgeJX/qo=
Date:   Tue, 2 Mar 2021 08:06:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Honor wakeup enabled/disabled state
Message-ID: <YD3kDrDTGKC4vGGj@kroah.com>
References: <20200915123123.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
 <20200915235032.GB1893@yoga>
 <YDU5ujJy5xiDXAJ3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDU5ujJy5xiDXAJ3@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 23, 2021 at 09:22:02AM -0800, Matthias Kaehlcke wrote:
> ping
> 
> I noticed this was never picked up, can it be landed or are there any
> concerns with this patch?

No idea, try resending it.

thanks,

greg k-h
