Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2D347AB00
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 15:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhLTOFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 09:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhLTOFG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 09:05:06 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23196C061574
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 06:05:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 744AACE10D1
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 14:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C514AC36AF6;
        Mon, 20 Dec 2021 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640009102;
        bh=KzpAx9znQyv1jrmm276bVkWo2kMRQstZqJH9yErRVYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XjHmUCQCc4WD3Whu8kOHPRDJJrTeoApQSgKMImJApNYawT+Cp1XIJrz9UHJDRAH7X
         OxEQvg4WJn8JvCl2SMJ+8Wxn9dTO0LC/K2+ZXnzuDoMhq7UpdMDSHE8ePOsGTHcuoQ
         jg4gQ/6mNoNqocL00P5dljxn1WmXowZSn4jGCw3CJJv9eXNEpiNQnUfHHwbe/fdDnM
         j05Zjd9FxjPQGst/NkoZMp+GMGcY5TAVNWjoz9QWDkwjaKU9fe0kt8ngDv3VrefIAd
         nXPFfGL8DapZ1qiHI9voYMgNLd0hv1DZTfopFPIVes+jwl1gg85AfT4Cw+D3dHMDtR
         KzmgfZmyeGSRQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mzJHc-0007T2-7b; Mon, 20 Dec 2021 15:04:56 +0100
Date:   Mon, 20 Dec 2021 15:04:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Filip =?utf-8?Q?=C5=BDaludek?= <filip.zaludek@oracle.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        Konrad Wilk <konrad.wilk@oracle.com>
Subject: Re: [External] : Re: data throttling under load when serial to usb
 adapter is used
Message-ID: <YcCNiH0fH6J5GZSe@hovoldconsulting.com>
References: <738e20c6-c709-d149-fe48-ee89540fe38a@oracle.com>
 <YcA+qegbpj0heal4@kroah.com>
 <67ff29fb-98cd-1835-ee6e-4eba67ff269c@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67ff29fb-98cd-1835-ee6e-4eba67ff269c@oracle.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 11:19:03AM +0100, Filip Žaludek wrote:

>   Yes, you are right! Such gadget hardware is without hw flow control.
>   I am using serial line only to capture console logs. I've tested
>   both commands also with sw flow control ixon, ixoff with similar
>   results.

The FTDI and PL2303 chips typically support automatic hardware flow
control, but you need to make sure the signals are wired up.

>   Hopefully somebody sitting on scarce big iron with both usb port and
>   serial port with proper hw flow control from this list gets
>   attracted to kindly re-test.

No need to retest anything. Just enable hardware flow control otherwise
there cannot be any guarantees.

> Interesting part for me is that only serial to usb direction is
> failing..

But in this case, it looks like your test script is just broken. You
kill the consumer before it has read all the data:

	uart_send__cat()
	{
	    cat < "$1" > /tmp/d16 &
	    RX_PID=$!
	    cat /tmp/d16_0 > "$2"
	    stty sane                           # better results
	    kill $RX_PID
	    wait $RX_PID
	    uart_info "$3"
	}

	...

	stty -F /dev/$SER 115200 raw -echo
	stty -F /dev/$USB 115200 raw -echo

	while true
	do
	    uart_send__cat /dev/$SER /dev/$USB "u->s"
	    uart_send__cat /dev/$USB /dev/$SER "s->u"
	done

Johan
