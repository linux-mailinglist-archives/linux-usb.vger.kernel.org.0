Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979D83F7C4F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 20:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238582AbhHYSiF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 14:38:05 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:41852 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbhHYSiE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 14:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=LaezaykJBpRzy9iCV385CqXN6VWPqI8dxlQEAsaf4oM=;
 b=hfQ3IhqkSB4mB02Lcc0InTD0eaAlP3qL0apETzWQe9cZShkO4M6uZoVx+mIFa7mlp/JBfwB8aJ2y3us3JUCh+OfK4C4V88gcwenoaARa4Bc1wSwIkVlS3wlJgtDSLWaRBgMLSScyNMCJoTxBQdNDzSqofCd012DYHNtT629CfhB98TEEk7KK8CDzaaYznVF2LFiPs4lscvWjV8CLUzlsgIfTkPDzNr4t6GaN8mIQhAI+NXj2k2uJX/hvmnyCRAdLKjFzCn6VQ9RjycDpC6aHkqcZDayOaZYbLE48XrlhBVTVZrvQlb27oLe2UljJld42ElGZKrvL7rCi5ty6f77JEw==;
DomainKey-Signature: a=rsa-sha1;
 b=KpgOO6r/+uXUDf4bfj9gKlsTUfY5h8NV+zr3fQter2IXm5WOw3OfNVZg0pxQ/fYYCZERVizuJFr8NLERYYy1mbj1XfT5ZAcedk9p1OUe0hC1KB5eW/EopFp9lOlZX6nsDWE6Lsb/hW+sEzHUUrr9c2fl5GWAhfTdE9qVSWSLLdpg3jlMNwlD/tzfvOG1iRARX+AlhXIq7WPc6kpzJpdiEqzGpw8gYkgdmgBMYMbHfedxzy5lKBVygDfDfLetagxJ6m9MrlvkU6pxmofeTQ2eg6UmqB0830zPQ9m1HtkDsgZyb4pvUUvXi1spNTDWr7Aq5GWh3oQxcZefDBar2rXZ5g==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=subject:from:to:cc:message-id:date;
Received: from [IPv6:2001:16b8:383a:7a00:76f6:3f2d:1d03:ccef]
 (2001:16b8:383a:7a00:76f6:3f2d:1d03:ccef) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 2E9387;
 Wed, 25 Aug 2021 18:37:14 +0000
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
From:   Ulrich Huber <ulrich@huberulrich.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
Message-ID: <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
Date:   Wed, 25 Aug 2021 20:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 5
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I just managed to get some more details. The bug definitely originates 
from `ucsi_handle_connector_change`. Within this function it is the 
second call to ucsi_send_command with UCSI_GET_CONNECTOR_STATUS that 
fails (Step 4).

`ucsi_send_command` calls `ucsi_exec_command` internally, which does the 
synchronous write and following read. Within `ucsi_exec_command` the 
check on line 134 fails:

if (cci & UCSI_CCI_COMMAND_COMPLETE)

Hope this is of some help.

Ulrich

