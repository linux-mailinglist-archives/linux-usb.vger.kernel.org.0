Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F5929539F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 22:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439614AbgJUUtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 16:49:24 -0400
Received: from aibo.runbox.com ([91.220.196.211]:50670 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405190AbgJUUtY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 16:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=CzH3SRellZ72GYzuAuSkXtCCJZ5Hg0QEgOahMSDZbec=; b=CXk8u7ephMlujjFXeUfHbi9vMg
        wMZAvQjs6Ymr2YSKS8NiqoYmAe9Pab4Us4sENLXU+R2sxSSUl+zc8o+OnijXYcZWi69dcSIsgH6BT
        5tWoW3ShT00c01ER/XK7/tKnhJsDTd0Rdv49etYtDPNhtOH/jGEgk7vXvd1DtmXXVNn2Jam7u4mwZ
        h2QM8y6Mfq98PFPcfQdMI6sljOo0FQSLHXraQQmssOozUaqiq5Rlfk8MXbbrU44dWS9ZXtSflFcTK
        nF3rwOAPP5cjCgrZ9FLhn7/KXQDZj3klh8KIPROVkYZNn3Nrwanb+SnWmsbKpl+aWQ59VHN8gq36r
        CLGJ45bA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kVL2u-0001Gj-I8; Wed, 21 Oct 2020 22:49:20 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kVL2n-0006hV-35; Wed, 21 Oct 2020 22:49:13 +0200
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Pany <pany@fedoraproject.org>, linux-usb@vger.kernel.org
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <20201020152859.GA945128@rowland.harvard.edu>
 <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
 <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
 <83bd4ab7-15a6-73c2-decd-1da1c393bad0@runbox.com>
 <5d2dc161951d0717d1ccfc88049c241c8ce8d1e6.camel@hadess.net>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
Date:   Wed, 21 Oct 2020 16:49:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <5d2dc161951d0717d1ccfc88049c241c8ce8d1e6.camel@hadess.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/10/2020 09.18, Bastien Nocera wrote:
> On Wed, 2020-10-21 at 09:08 -0400, M. Vefa Bicakci wrote:
>> On 21/10/2020 07.53, Bastien Nocera wrote:
>> [Snipped by Vefa]
>>>
>>> I have no idea why there isn't a match function. Patch v1 had a
>>> huge
>>> table:
>>> https://marc.info/?l=linux-usb&m=157062863431186&w=2
>>> and v2 already didn't had that comment, but no .match function:
>>> https://marc.info/?l=linux-usb&m=157114990905421&w=2
>>>
>>> I'll prepare a patch that adds a match function. I'll let you
>>> (Vefa)
>>> look at which of your patches need backporting though, as I'm
>>> really
>>> quite a bit lost in the different patch sets and branches :/
>>
>> Hello Bastien,
>>
>> Having found the root cause of the issue by going through Pany's
>> logs and having proposed a solution, I was hoping to get credit
>> for the resolution of the issue by authoring the patch.
> 
> I don't care either way. Attached are the 2 patches I had made and was
> in the process of compiling and testing, feel free to adapt them,
> change the authorship, etc.
> 
> Note that you mentioned you'd need to "replace the ID table with
> a match function", which will mean that the driver isn't automatically
> loaded when a device gets plugged in. So that wouldn't have worked.
> 
> Let me know when you've made your patch, as I'll need to update this
> bug when there's something to test:
> https://bugzilla.redhat.com/show_bug.cgi?id=1878347
> 
> Cheers

Hello Bastien,

Sorry about my delayed reply. Thank you, and I appreciate your understanding.
I intend to continue the work starting later today, and I will make
sure that you are credited by using the co-developed-by tag in the
patches, as you have mentioned in your more recent e-mail in this thread.

I will investigate/verify the ID table vs. match function aspect
as well; I understand that my suggestion could be incorrect.

Thanks again,

Vefa
