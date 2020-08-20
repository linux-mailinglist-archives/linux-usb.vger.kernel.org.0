Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCA924BA2A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 14:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgHTMBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 08:01:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:32669 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729911AbgHTMB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 08:01:29 -0400
IronPort-SDR: DDSfPRtp6nP4ltP959ZqcFmFhk+rLxygT0GSZcXEiDJBFD56AV7VEjLO0otWdFvQOSOL+uBZIg
 yA8slY+91+kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="152880514"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="152880514"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 05:01:23 -0700
IronPort-SDR: Ue0xaKDoSd8ZLMmMu695W+q2OqVQsTJq8YeMCTs/Mog7syPnFnopoErbKfZAfsFA2zRX4V2qIK
 LobHFZt/SBLA==
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="472628791"
Received: from ndadhani-mobl.gar.corp.intel.com (HELO [10.213.64.199]) ([10.213.64.199])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 05:01:12 -0700
Subject: Re: [PATCH 1/2] thunderbolt: Disable ports that are not implemented
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
References: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
 <CA+CmpXs+WHj_PS51s=nOAJp9pvn6atDhVi0FtNasHfqqJ9MhXw@mail.gmail.com>
 <20200819124512.GJ1375436@lahna.fi.intel.com>
From:   "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>
Message-ID: <5227d92b-069d-7026-9136-5036cfbe3fee@linux.intel.com>
Date:   Thu, 20 Aug 2020 17:31:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819124512.GJ1375436@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/19/2020 6:15 PM, Mika Westerberg wrote:
> On Wed, Aug 19, 2020 at 02:54:39PM +0300, Yehezkel Bernat wrote:
>>> - * @disabled: Disabled by eeprom
>>> + * @disabled: Disabled by eeprom or enabled, but not implemented
>>
>> I'm not a native speaker, so I'm not sure about it, but maybe the comma here is
>> superfluous and just confuses the reader. To me it looks like it means
>> "(disabled
>> || enabled) && !implemented" instead of "disabled || (enabled && !implemented)". >> Any opinion?
> 
> For me (also non-native speaker) I don't see a difference but sure I can
> remove it :)
> 

I meant the second - "disabled || (enabled && !implemented)"
(also non-native speaker). If the comma confuses the reader please 
remove it.

Regards
Nikunj
