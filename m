Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2D3137CC9
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 10:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728788AbgAKJuG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 04:50:06 -0500
Received: from cable.insite.cz ([84.242.75.189]:52251 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728747AbgAKJuG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jan 2020 04:50:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id D23BBA1A40B08;
        Sat, 11 Jan 2020 10:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578736203; bh=u0G64Bzc4I16kFDz6tWjlnD2uX7+vljVmbMPiddzRb0=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=hp/hCYJXz3R03Jr/uIJEJAGLrn+FlJsX/PkHeIERkkArFeWqcGIdOKVKxY1d8HZhn
         OgFrEC+n8Vk3bksDUybkYZhVmLg2OIGcQSW77RDahKdoyFCoGEZgQ4uRVkuYG8WQv5
         y/HgVmv1FX1AphzLRy/9+qSNMGhT2xlF0X9nk7UA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gY9f95uTf3M3; Sat, 11 Jan 2020 10:49:58 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 1A0DCA1A40B07;
        Sat, 11 Jan 2020 10:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578736198; bh=u0G64Bzc4I16kFDz6tWjlnD2uX7+vljVmbMPiddzRb0=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=dT6/9WCP1fAF2/6Z/s1DK+GeRwTChwb3ArQfSvCIRdUYXcLiEf7ZpgBDPSqudayx7
         e7jeliz0b7SrlRVxWYMkofg3YPCmG7VpC7yvk3R/aBFc4CYlZPyQrdhC6qdp+CBw31
         /lXfnXhbBOdnK+oWE6ts7fsniOP3uTP558+WlrtI=
Subject: Re: USB:UAC2: Incorrect req->length > maxpacket*mc - cause likely
 found
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
Message-ID: <b648741c-83f4-3da0-335f-61c5a0c7b3e6@ivitera.com>
Date:   Sat, 11 Jan 2020 10:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 11. 01. 20 v 10:31 Pavel Hofman napsal(a):
> Unfortunately I do not know the reason for selection of the maximum 
> value from FS and HS, I cannot create a patch. Very likely there is more 
> hidden know-how which I do not know.
> 

The change was introduced by 
https://github.com/torvalds/linux/commit/eb9fecb9e69b0be8c267c55b0bb52a08e8fb6bee#diff-db92e74adcaaf2659ecf1a2135fd5901R572
