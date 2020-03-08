Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3541917D5C4
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2020 20:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgCHTJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Mar 2020 15:09:12 -0400
Received: from mon1.sibername.com ([162.144.64.251]:57192 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgCHTJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Mar 2020 15:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=emeLghREBaTtsJNN317gUlDG5KSsVX3OZ17B2YqytS0=; b=JXJ8aZ3DFN6BvP9gU62fP5/Rxx
        hS8XDzfbFzqBT84akARyUCS9Ow0aKZ6gHVN0mHz8Q2ZuXjd7Fi2NrjJvg2Yzc3AyXySFztTFEZMkN
        SR7iMiHa7pigZ3S2dmxL+n6Dn/2LBcJxQyswf86jW1st2IkkKrMPa7sa//lwDqBMAzNj+guzzyZHg
        V9+VTeb5g3qA+cz0d6cX83EGtiPkAU0CP3egRIh+SlYvQidrPuIU5nXVid9uWjA2HbmYoYPbHphPQ
        uDF51HzbOUzMG++vBMoIRIlGirx7T6niMG14ero0epi8H89PUN995vK4uHnDYbB3oE1gEyE3CkjaE
        iQudTgLg==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:43188 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1jB1IT-00B275-77
        for linux-usb@vger.kernel.org; Sun, 08 Mar 2020 15:09:10 -0400
Subject: Re: dvdrw USB3 drive seen as USB2
To:     linux-usb <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.2003081143200.30710-100000@netrider.rowland.org>
From:   James <bjlockie@lockie.ca>
Message-ID: <ba2eaac7-afdb-9714-7bd8-2f1399adc08f@lockie.ca>
Date:   Sun, 8 Mar 2020 15:09:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2003081143200.30710-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2020-03-08 11:54 a.m., Alan Stern wrote:
> On Sat, 7 Mar 2020, James wrote:
>
>> https://github.com/aircrack-ng/rtl8812au/blob/v5.6.4.2/README.md
>>> USB Mode Switch
>>>
>>> 0: doesn't switch, 1: switch from usb2.0 to usb 3.0 2: switch from
>>> usb3.0 to usb 2.0
>>>
>>> $ rmmod 88XXau
>>> $ modprobe 88XXau rtw_switch_usb_mode:int (0: no switch 1: switch from
>>> usb2 to usb3 2: switch from usb3 to usb2)
> Have you tried using this driver?  Does it work?
Neither the bu or the au driver get me above 144Mbps and the network is 
only an (5GHz N I think).
One of the comments about the bu driver was that the person thinks it 
doesn't have the code to do 80211AC.
Someone has the au working at 866Mbps (80211AC).
I want to use it on my Raspberry Pi 4 but it is not x86 so I haven't 
been able to compile it.
The is an au package but it is an old driver and caused a lot of problems.
I am looking for an Atheros or Intel USB one (5GHz 80211N) but I haven't 
found anything yet.
>
> Maybe you can convince the authors of this 88XXau driver to merge it
> with the rtl88x2bu driver already in the standard kernel.  That's what
> was managing your Realtek adapter in your earlier email.
I wish Realtek would but there doesn't seem like much interest.

