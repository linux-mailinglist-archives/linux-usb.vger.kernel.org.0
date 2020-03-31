Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2040419A288
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731427AbgCaXfH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:35:07 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38683 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbgCaXfH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:35:07 -0400
X-Originating-IP: 81.6.44.130
Received: from [172.22.0.76] (unknown [81.6.44.130])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4BA54E0004;
        Tue, 31 Mar 2020 23:35:04 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH 0/4] ch341: Add support for HL340 devices
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1583520568.git.public@hansmi.ch>
 <20200324100530.GD5810@localhost>
X-Hello-World:  This header intentionally left blank
Message-ID: <215b85d8-4cec-aa05-3738-75fe6f6fd5bc@msgid.hansmi.ch>
Date:   Wed, 1 Apr 2020 01:35:04 +0200
MIME-Version: 1.0
In-Reply-To: <20200324100530.GD5810@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.03.20 11:05, Johan Hovold wrote:
> On Fri, Mar 06, 2020 at 07:00:41PM +0000, Michael Hanselmann wrote:
>> A subset of CH341 devices does not support all features, namely the
>> prescaler is limited to a reduced precision and there is no support for
>> sending a RS232 break condition.
>>
>> These devices can usually be identified by an imprint of "340" on the
>> turquoise-colored plug. They're also sometimes called "HL340", hence the
>> terminology in this series and driver.
> 
> You need to come up with a different designation. I have a HL340 device
> here which works just fine.

Thank you, I didn't know whether the behaviour I'm seeing affects others
too. I removed the "HL340" designation for the next revision.
