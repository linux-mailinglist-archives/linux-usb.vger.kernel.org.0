Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CACB4A3C90
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 03:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357363AbiAaCSm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jan 2022 21:18:42 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:60543 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233994AbiAaCSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jan 2022 21:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q+uXtwx9NEH6aK/fkTVR/DoULDhGXwtsqfimFV6w5bY=; b=OsccMNry5Cv3OtIL/zBoaC9NVM
        UB/RstlQjcIwQ7RdUPHCePcmx+eWDLi4OQhtJN5twcBAUlvr0VSS25l8VH6xTwVBbk1WRZyJTK0Wx
        361UhUbUwXeqziQjQDqVIHQ10mrzhm2Ns9X7Q7w4Bo63JrhfGDhb9FFr3P7epp2O46FVUqAsA+Hoo
        1o2V9ZP/japt/FKqLspDpji3R/fRhugEV0hnRIlbJ/EVLpJ3wPvZ1jAWi3TTa2/uZkF1oIblfvUPF
        zhyRv7if0NBXfMK3wYmHJFvoWK8muEon9fwaYOTYTCFLojeM70pDXJaHdkVKPQeQlPHYvpL+CXevu
        2dd7RR6Q==;
Received: from [66.79.250.116] (port=55746 helo=[192.168.68.65])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1nEMHB-0004xu-HR; Mon, 31 Jan 2022 13:18:41 +1100
Message-ID: <18b2040c-dea0-e7c4-fd10-c29701d55b91@lockie.ca>
Date:   Sun, 30 Jan 2022 21:18:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: what could cause a cmd cmplt err -2
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <b83861ab-fd5e-3021-70d1-3647f7b8eeb0@lockie.ca>
 <YfdErJ/SyFB2I5UA@rowland.harvard.edu>
From:   James <bjlockie@lockie.ca>
In-Reply-To: <YfdErJ/SyFB2I5UA@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2022-01-30 21:08, Alan Stern wrote:
> On Sun, Jan 30, 2022 at 01:55:35PM -0500, James wrote:
>
> It's not easy to tell why the command timed out.  Maybe the drive
> encountered a problem and therefore wasn't able to execute the command.
> Or maybe it did execute the command but the response message going back
> to the computer got lost.
Can I increase the timeout?

The error is always exactly the same.
Could there be a bad sector on the drive?
