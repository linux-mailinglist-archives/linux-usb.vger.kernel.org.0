Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B3513B394
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 21:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgANUVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 15:21:52 -0500
Received: from cable.insite.cz ([84.242.75.189]:52790 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgANUVw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 15:21:52 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 55731A1A40B06;
        Tue, 14 Jan 2020 21:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579033309; bh=Kkj+M/TPOSogtnSgaQT8dVXOFyIslMW+QNGljT04EaM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DQirdZ6BbLzSk/HK6/eDnPTRcVTDHksm8xQrC3hKIkvSAG4/dajVH+Xj9Fs4xRlGc
         1bcZ+1Z6Y6KM9xG4LyzJWpEwsB5VRvc/XqHyzdU+IdfNw4Fgtn/YB87XSwgKWg3S0y
         OCYN6ImX3d7JVckQdrOyTPoWjqVavnGiZD6M21ug=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ucjvjzbk6PO4; Tue, 14 Jan 2020 21:21:44 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C5617A1A40B05;
        Tue, 14 Jan 2020 21:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579033303; bh=Kkj+M/TPOSogtnSgaQT8dVXOFyIslMW+QNGljT04EaM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WzsRU2SvOus1c45d/TG/QbbLa2LawDlh9bz81BV2bb/ON7LgJDVlQLLENk9l0VU0b
         o1Xfr6VvPhmYGGKhAbiQJrlPNmVS/osyXvh6p+08rIg4Jbu+knt6YJvnzj0cAwyoDT
         Hoz4EqkK4LfQBQfkwIHRWR21E3sqry7EPWwpwFdI=
Subject: Re: USB:UAC2: Incorrect req->length > maxpacket*mc - cause likely
 found
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
 <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
 <20200114200450.064cd521.john@metanate.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <54263302-4efc-b06f-593e-bd196b66c83f@ivitera.com>
Date:   Tue, 14 Jan 2020 21:21:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200114200450.064cd521.john@metanate.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

Dne 14. 01. 20 v 21:04 John Keeping napsal(a):
> 
> I've taken a look at this and the patch below fixes it in my simple
> testing.  

I like your solution, simple and understandable.

> But note that this doesn't adjust the PCM's min_period_bytes
> which will be necessary if you want to minimize latency with an adjusted
> high-speed bInterval setting.

My motivation for the smaller bInterval is higher attainable throughput. 
In fact to reach stable operation (avoiding random xruns) I have to use 
larger period on RPi4 - hence larger latency anyway.
> 
> I'm not sure what the right answer is for that; we could update
> min_period_bytes if the PCM is opened after the gadget attaches, but
> then if it is re-attached at a slower speed the PCM configuration will
> be wrong.

I would suggest to keep the minimum period setting as is.

Thanks a lot for your help.

Pavel.
