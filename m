Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDEFD13BC6C
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgAOJ2Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:28:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:47982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729143AbgAOJ2Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 04:28:16 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1663207FF;
        Wed, 15 Jan 2020 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579080496;
        bh=/q1yvxpP7Z5eb12vjS/n4MSNvaJ0V9JvimwNvweS8Ng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=obV5AkBDe+CfJk70zZGxUOdT6nJ6X61eaU52UEZenmuAqCxeWAa3C2KwNqr1VNeg+
         FfkJ2oNo5UG6yk+gWzSo1vyEv0tf6ysIFGbOXl/G30YzJoRBwCQikKTBHBICbYprXI
         8pM9HaohwRiEjt5/94vnuPST402acrRM/G6zFVgI=
Date:   Wed, 15 Jan 2020 10:28:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.6 merge window
Message-ID: <20200115092813.GA3153837@kroah.com>
References: <878sm96pzf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sm96pzf.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 15, 2020 at 11:14:28AM +0200, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's my pull request for v5.6 merge window. If you want anything to be
> changed, let me know.

Did you send this twice?  Any difference?

