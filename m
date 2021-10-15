Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8BA42E8FC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Oct 2021 08:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbhJOGb2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Oct 2021 02:31:28 -0400
Received: from mailout.easymail.ca ([64.68.200.34]:44100 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbhJOGb1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Oct 2021 02:31:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id 09A2B67EED
        for <linux-usb@vger.kernel.org>; Fri, 15 Oct 2021 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634279361;
        bh=3IdGE6PQgT2X3zZIl6tZdOMI5g89u87BA5HkE35Lce4=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=NfWlX7tw4lj4tuhpbdxx1dywxQx9vk6Z9UOlbZjrW1nh2w3xBNYSfMvghGAw0MUP4
         OPotlqQDVN2hZJO89Gk8EUxUu/eZKxg7u4IpsWEz+nFxlXGfgiMm4q8SjmWZATt82a
         xRMmm5QSdEZhftMWtqv1GlUJ7sc9MSTLy60pz0kNcz0abS3JtMcvPJt3D6WLgPsOzO
         TZKD8dXsCknt5yTNCDm0ecrfrHnrqe/mIllZWM/yGkmsm4N0gfRCmm1v/ZygziwQwZ
         1U0FI4FGkSWFSujnWi+10cxVBa0Y+SAFVA0wyFF3iT7CGF5ZverzCicqs6UcJ1BXYg
         3vmsb8yEtOVqg==
X-Virus-Scanned: Debian amavisd-new at emo05-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo05-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id af12mFGjT2vH for <linux-usb@vger.kernel.org>;
        Fri, 15 Oct 2021 06:29:20 +0000 (UTC)
Received: from messages.easymail.ca (unknown [172.17.13.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id AAD8767EA7
        for <linux-usb@vger.kernel.org>; Fri, 15 Oct 2021 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634279360;
        bh=3IdGE6PQgT2X3zZIl6tZdOMI5g89u87BA5HkE35Lce4=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=gN1R+DRKhxtPWS4WEndG+8j8eKNe56Zx/VXxD1Fu0atdXwyyvdHzI9F41KMOBNaso
         IaZbPlm7NRrWYI2WM44ZMpwjbP1HW1n4EOWORdqt//tFkC32u0A93X4ZvDfBaUqyS7
         hR+vSX40yEglVyLjfqxoM1YOWqevzv6IxjVST9fXfpEyRuvS6wYuXNfenWZeeVgDOn
         M1EldVN76/KGASB4qc9fVBiaX+kTmYQQnxf/IDEFq3wSZao++mJDJncKaJ61E1Celj
         eW6k80hEHmJkQVMENrtHdZeTjwamXCsZTR8sr14jxb/0DJpz6pm6pIZ6sfeOyVr3IO
         mKwxXzmMmZ25g==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Oct 2021 01:29:20 -0500
From:   braewoods@braewoods.net
To:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add compatibility quirk flags for iODD
 2531/2541
In-Reply-To: <20211014022049.GB910341@rowland.harvard.edu>
References: <20211014015504.2695089-1-braewoods+lkml@braewoods.net>
 <20211014022049.GB910341@rowland.harvard.edu>
Message-ID: <8466fa531529630936ee0f0e290b54b2@braewoods.net>
X-Sender: braewoods@braewoods.net
User-Agent: Roundcube Webmail/1.3.3
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-10-13 21:20, Alan Stern wrote:
> In the future, you should always include a version number in the email
> Subject: line (for example, "[PATCH v2]") so that readers will know
> which patch is which.  And you should include, here just below the 
> "---"
> line, a description of how this version differs from the previous
> version.  See the email archives for examples of multi-version patches.
> 
> Nevertheless, this looks okay.
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Noted. I'll do that for future patches. On a side note, any idea how 
long it normally takes to get a simple patch like this committed? I've 
had mixed experiences with getting feedback on patches. Sometimes my 
patches just get totally ignored.
