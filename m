Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCCB2402F3
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 09:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHJHpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 03:45:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:51890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgHJHpt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 03:45:49 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2A542065C;
        Mon, 10 Aug 2020 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597045549;
        bh=dq4Zy/CeFmHQYVTM5GklBdsD9JSUlFhjHQ64cOaA+hU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AFCSKimFu1k6eQglbr6/Ex3KsUJijB2jonlNiH1h55Iud2nlwMCTljtu1yv0FYTAq
         /xH7/UAX5E/q2i3q8CoZY5GL5+z5Cg/VJrrnrroUtODzqrPH0GvOIfdlrubXTM6L38
         iaFpb38hSmIwqOBAuPSMN8Uni9j60Y1uFATuTdqg=
Date:   Mon, 10 Aug 2020 09:46:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yasushi Asano <yazzep@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com,
        jim_baxter@mentor.com, wnatsume@jp.adit-jv.com,
        nnishiguchi@jp.adit-jv.com, yasano@jp.adit-jv.com
Subject: Re: [PATCH v2] [RFC] USB: hub.c: decrease the number of attempts of
 enumeration scheme
Message-ID: <20200810074601.GC1529187@kroah.com>
References: <20200808151648.GC256751@rowland.harvard.edu>
 <20200810001935.4489-1-yazzep@gmail.com>
 <20200810001935.4489-2-yazzep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200810001935.4489-2-yazzep@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 09:19:35AM +0900, Yasushi Asano wrote:
> From: Yasushi Asano <yasano@jp.adit-jv.com>
> 
> According to 6.7.22 A-UUT “Device No Response” for connection timeout
> of USB OTG and EH automated compliance plan v1.2, the enumeration
> failure has to be detected within 30 seconds. However, the old and new
> enumeration schemes made a total of 16 attempts, and each attempt can
> take 5 seconds to timeout, so it failed with PET test. Modify it to
> reduce the number of attempts to 5 and pass PET test.
> 
> in case of old_schene_first=N and use_both_schemes=Y
> attempt 3 * new scheme, then 2 * old scheme
> in case of old_schene_first=Y and use_both_schemes=Y
> attempt 2 * old scheme, then 3 * new scheme
> 
> Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

Why is there a "[RFC]" on the subject line, do you not think this works
properly?  Does it work for your devices and solve the problem for you?

thanks,

greg k-h
