Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D713F8F36
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 21:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhHZTvu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 15:51:50 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:44816 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhHZTvt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Aug 2021 15:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=QlKEWXLX87REIUvv+WzYju7lXs+0HpoEmYSMOJmvkj4=;
 b=wPJUw38VeiY5ibEmpW9BVdEQkldNehfSA7yCa4qMEBcZ8MQ9C5UFJUKqtouJ4UAUNKazeArgfb0QSHCIGHNWhFt17nGj0UFVAgaQHoq4JCNyjo9KtpWcyraQXUxvLtqL7e7mLYSrqZ0qM7NWBxZWuRwKk3fgm5iWS6K3yX5F8EivtjoOTg1HahceqOlE/VJ4RhZt5mBTDpczyDPQl8She0gAFBH1VZVrLK/NfdCt4DuLesxdLZWeKOW7I5UYU982DGeJDvSaQ2/+lV31tBieLsbF08l8TKzY0dlMZQ8QfwkNZmgsErFPi6f8GRPjg4UrRchTMGR3PTGWX+P7SBoWGQ==;
DomainKey-Signature: a=rsa-sha1;
 b=LoVgaBU9C5cnbK0FC/cMCNP2oPwt87hFnr8RkYqNXH71/28EdlUPZE0IO+B/sqPW1sAkhO9U2Qs2M7huIH8DddFcLr2IHbgK5aNVJ1p+JyTV1FCbHgggbJfVIRVLLr1ih+n8LOUsaAR+Ya5HKcvYTTphOOTgQtfyiSZof7aUjxD9918z9hC1f+WaZi4/1QrFNWs+ZBzpT2PWsg7Svi0v5IbVW9PysTV43LSrajKOu8yhzrwd30J/+7vl8PBCY2dlBTXK167Q8M2I9j3rnep1tOxMSYJ317pM8CmR6Zc3EwTmi+XiwrTqZ/RUZLsEIf+ltAgb/BA/EOabicFH21xMyg==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=subject:to:cc:from:message-id:date;
Received: from [IPv6:2001:16b8:2d8c:c400:a636:96c2:a21b:ad38]
 (2001:16b8:2d8c:c400:a636:96c2:a21b:ad38) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 18B45A;
 Thu, 26 Aug 2021 19:50:59 +0000
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
 <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
 <YSekP0+tq6ISq6my@kuha.fi.intel.com>
From:   Ulrich Huber <ulrich@huberulrich.de>
Message-ID: <3fe6d701-bc14-9b26-a5af-aa38fe7c585e@huberulrich.de>
Date:   Thu, 26 Aug 2021 21:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSekP0+tq6ISq6my@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.08.21 16:25, Heikki Krogerus wrote:
> On Wed, Aug 25, 2021 at 08:37:14PM +0200, Ulrich Huber wrote:  >> Hi, >> >> I just managed to get some more details. The bug 
definitely originates from >> `ucsi_handle_connector_change`. Within 
this function it is the second call >> to ucsi_send_command with 
UCSI_GET_CONNECTOR_STATUS that fails (Step 4). >> >> `ucsi_send_command` 
calls `ucsi_exec_command` internally, which does the >> synchronous 
write and following read. Within `ucsi_exec_command` the check >> on 
line 134 fails: >> >> if (cci & UCSI_CCI_COMMAND_COMPLETE) >> >> Hope 
this is of some help. > Thanks for debugging this.
You are welcome!
> Yeah, I think that the second GET_CONNECTOR_STATUS immediately after  > the first one is confusing the firmware on some board> > I'll send 
you a patch series I've been working on that tries to > improve the 
situation. I better include the list as well (sending it > as RFC).
I just got around to test your patches. They seem to solve the issue 
completely! Whatever I tried, the behavior of the port stayed consistent 
and no error messages appeared in the log.

I'll continue using the patch for now and will notify you, should any 
issue appear.

Thanks
Ulrich



