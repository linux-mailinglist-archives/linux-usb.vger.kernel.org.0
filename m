Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9B12FD450
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 16:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731880AbhATPiu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 20 Jan 2021 10:38:50 -0500
Received: from mail.msweet.org ([173.255.209.91]:48906 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbhATPfF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Jan 2021 10:35:05 -0500
Received: from [10.0.1.137] (cbl-66-186-76-47.vianet.ca [66.186.76.47])
        by mail.msweet.org (Postfix) with ESMTPSA id C63C1808B1;
        Wed, 20 Jan 2021 15:34:17 +0000 (UTC)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
From:   Michael Sweet <msweet@msweet.org>
In-Reply-To: <YAhKAiz2U9KQWQPE@kroah.com>
Date:   Wed, 20 Jan 2021 10:34:16 -0500
Cc:     Paul Wise <pabs3@bonedaddy.net>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <C57FE70F-3EB2-48A4-913B-9C55F0122DD2@msweet.org>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <YAhKAiz2U9KQWQPE@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg,

> On Jan 20, 2021, at 10:19 AM, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> ...
>> I don't propose to move maintenance of these projects to kernel.org
>> since the issue and pull request databases for them are on GitHub and
>> would need to be preserved.
> 
> If you are moving the repos, why do you care about the issue and pull
> request database anymore?  Will they just not end up going away?

Moving the Github projects under a new owner/organization will also move the issues and pull requests. You only lose the info if you fork the project under the new organization...

________________________
Michael Sweet



