Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE93687AD1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjBBKuq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBBKup (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E86B8A7F9
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675334935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hni8RyJwUI9pK/JShhsW1noPvQwnTV2b6Z/zTe+GZpg=;
        b=En+QXvfGLtgIzztgn9BGYEMGKn+Pb7sUV6vgRPH8v8eC8ByC0IPQaUGizAfGKv/K3upkZF
        Tf7vVSQ5BCCF3IkAFfMeutWVHp6spEailiAbS5C/iSHfDDLesJryUyTdsudEEs1rwbA6S3
        +5UIEl9d90xzrTYWNFW7V8gRqTbSj1I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-RYggNlp4NhKLZny7yIdxvA-1; Thu, 02 Feb 2023 05:48:54 -0500
X-MC-Unique: RYggNlp4NhKLZny7yIdxvA-1
Received: by mail-ej1-f71.google.com with SMTP id he34-20020a1709073da200b00887ced84328so1291770ejc.10
        for <linux-usb@vger.kernel.org>; Thu, 02 Feb 2023 02:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hni8RyJwUI9pK/JShhsW1noPvQwnTV2b6Z/zTe+GZpg=;
        b=k9+eds46F+ndTR0CtBCGAkpbhHCpFimIwqbWYTqdffOY29UJfvveeb9s1Xkw0DBjYC
         U8UndGP7PBW85Rk2LTJFnemtXxYwXLd6lTdIgdeFyaIf8yFZHxLmQMLXIaKcpb3lDuVu
         BKH7jv+sVMY3/8ODWUMUCwoNvYzNhR8KpeVKSEWFy7iQTZrp5hhWcNTXaLXBRfNtkLNL
         n54SH8jXaO/U/pmgbS1hXCebxtgj5uAdiMyxvOUaLi+mD/IUYqW/gfwb5OoB41BhHQz2
         AEieQI6FNdoEuGP0P/JszZ+t/V1JcZCss6gzBXb24qKfOYkz7YcBEq/9oBLYIpe4pfIy
         aapg==
X-Gm-Message-State: AO0yUKVpnIJiKQOpiYUUwLdU+Y4x/hF0c+dzblAmuo+28SHLyuL6baWs
        sZrTI1r7pYUIc04KvjOHWFK2+B2Lq2NbH9W/h1NCIqSgvCTdprpQDIBcMqv1kTHmHHb9XRsX0PX
        vSzmT6EsVZ6/N5BW+u434
X-Received: by 2002:a17:906:5a09:b0:886:221b:44de with SMTP id mx9-20020a1709065a0900b00886221b44demr4562695ejc.0.1675334932728;
        Thu, 02 Feb 2023 02:48:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8Uun7xwBmnOJU08ijOFAC0wKlV758JS5JraCtFo2SJIo57KFFlmIyDWw0DCc3fPXZ07mRMqg==
X-Received: by 2002:a17:906:5a09:b0:886:221b:44de with SMTP id mx9-20020a1709065a0900b00886221b44demr4562685ejc.0.1675334932532;
        Thu, 02 Feb 2023 02:48:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906711900b00878b89075adsm10666286ejj.51.2023.02.02.02.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:48:51 -0800 (PST)
Message-ID: <5486235f-e205-ea00-0320-cb64e9d55d7d@redhat.com>
Date:   Thu, 2 Feb 2023 11:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: 6.0-rc1 new XHCI cacheline tracking EEXIST WARN/oops
Content-Language: en-US, nl
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <587e5aa0-63d2-3b0b-4cc5-8c0240a9e8df@redhat.com>
 <0e13b14f-be11-3f00-28b6-fa334667ee35@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0e13b14f-be11-3f00-28b6-fa334667ee35@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/23/22 10:04, Mathias Nyman wrote:
> On 19.8.2022 15.04, Hans de Goede wrote:
>> Hi All,
>>
>> While dogfooding 6.0-rc1 on my main workstation I noticed the following
>> new WARN/oops:
>>
>> Aug 19 12:22:39 shalem kernel: ------------[ cut here ]------------
>> Aug 19 12:22:39 shalem kernel: DMA-API: xhci_hcd 0000:30:00.3: cacheline tracking EEXIST, overlapping mappings aren't supported
>> Aug 19 12:22:39 shalem kernel: WARNING: CPU: 14 PID: 8321 at kernel/dma/debug.c:570 add_dma_entry+0x1ed/0x270
>> Aug 19 12:22:39 shalem kernel: Modules linked in: rfcomm snd_seq_dummy snd_hrtimer qrtr bnep vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) binfmt_misc vfat fat intel_rapl_msr intel_rapl_common iwlmvm snd_hda_codec_realtek snd_hda_codec_generic edac_mce_amd mac80211 ledtrig_audio snd_hda_codec_hdmi kvm_amd snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi libarc4 kvm snd_hda_codec irqbypass iwlwifi snd_hda_core snd_usb_audio btusb rapl btrtl snd_usbmidi_lib iwlmei btbcm snd_hwdep btintel snd_rawmidi snd_seq mc btmtk snd_seq_device cfg80211 wmi_bmof bluetooth snd_pcm joydev snd_timer rfkill mei r8169 snd soundcore i2c_piix4 k10temp gpio_amdpt gpio_generic zram dm_crypt amdgpu drm_ttm_helper ttm iommu_v2 crct10dif_pclmul gpu_sched crc32_pclmul crc32c_intel drm_buddy hid_lg_g15 drm_display_helper nvme ghash_clmulni_intel nvme_core ccp cec sp5100_tco wmi video hid_logitech_hidpp uas usb_storage hid_logitech_dj ip6_tables ip_tables fuse i2c_dev
>> Aug 19 12:22:39 shalem kernel: Unloaded tainted modules: acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 amd64_edac():1 acpi_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 fjes():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1 acpi_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 amd64_edac():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 amd64_edac():1 pcc_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 fjes():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1
>> acpi_cpufreq():1 pcc_cpufreq():1
>> Aug 19 12:22:39 shalem kernel:  fjes():1 acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 fjes():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1 acpi_cpufreq():1
>> Aug 19 12:22:39 shalem kernel: CPU: 14 PID: 8321 Comm: kworker/u64:57 Tainted: G           OE     -------  ---  6.0.0-0.rc1.20220817git3cc40a443a04.14.fc38.x86_64 #1
>> Aug 19 12:22:39 shalem kernel: Hardware name: Micro-Star International Co., Ltd. MS-7C95/B550M PRO-VDH WIFI (MS-7C95), BIOS 2.90 12/23/2021
>> Aug 19 12:22:39 shalem kernel: Workqueue: events_unbound async_run_entry_fn
>> Aug 19 12:22:39 shalem kernel: RIP: 0010:add_dma_entry+0x1ed/0x270
>> Aug 19 12:22:39 shalem kernel: Code: ff 0f 84 97 00 00 00 48 8b 5f 50 48 85 db 75 03 48 8b 1f e8 15 96 85 00 48 89 c6 48 89 da 48 c7 c7 30 c9 86 85 e8 73 99 ce 00 <0f> 0b 48 85 ed 0f 85 a9 50 cf 00 8b 05 f2 09 23 02 85 c0 0f 85 ca
>> Aug 19 12:22:39 shalem kernel: RSP: 0018:ffffa78dc2c0ba20 EFLAGS: 00010282
>> Aug 19 12:22:39 shalem kernel: RAX: 0000000000000060 RBX: ffff8ac186a636c0 RCX: 0000000000000000
>> Aug 19 12:22:39 shalem kernel: RDX: 0000000000000001 RSI: ffffffff858d07a4 RDI: 00000000ffffffff
>> Aug 19 12:22:39 shalem kernel: RBP: ffff8ac184f17a80 R08: 0000000000000001 R09: 0000000000000001
>> Aug 19 12:22:39 shalem kernel: R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
>> Aug 19 12:22:39 shalem kernel: R13: 0000000000000001 R14: 0000000000000206 R15: 00000000042f65bd
>> Aug 19 12:22:39 shalem kernel: FS:  0000000000000000(0000) GS:ffff8ac409a00000(0000) knlGS:0000000000000000
>> Aug 19 12:22:39 shalem kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> Aug 19 12:22:39 shalem kernel: CR2: 0000000000000000 CR3: 000000014c028000 CR4: 0000000000750ee0
>> Aug 19 12:22:39 shalem kernel: PKRU: 55555554
>> Aug 19 12:22:39 shalem kernel: Call Trace:
>> Aug 19 12:22:39 shalem kernel:  <TASK>
>> Aug 19 12:22:39 shalem kernel:  dma_map_page_attrs+0x82/0x2d0
>> Aug 19 12:22:39 shalem kernel:  ? _raw_spin_unlock_irqrestore+0x30/0x60
>> Aug 19 12:22:39 shalem kernel:  usb_hcd_map_urb_for_dma+0x423/0x500
>> Aug 19 12:22:39 shalem kernel:  usb_hcd_submit_urb+0x9b/0xb80
>> Aug 19 12:22:39 shalem kernel:  ? lockdep_init_map_type+0x62/0x260
>> Aug 19 12:22:39 shalem kernel:  usb_start_wait_urb+0x55/0x140
>> Aug 19 12:22:39 shalem kernel:  usb_control_msg+0xc9/0x120
>> Aug 19 12:22:39 shalem kernel:  hub_ext_port_status+0x89/0x110
>> Aug 19 12:22:39 shalem kernel:  hub_activate+0x11c/0x8b0
>> Aug 19 12:22:39 shalem kernel:  ? usb_dev_thaw+0x10/0x10
>> Aug 19 12:22:39 shalem kernel:  hub_resume+0x23/0xe0
>> Aug 19 12:22:39 shalem kernel:  ? usb_dev_thaw+0x10/0x10
>> Aug 19 12:22:39 shalem kernel:  usb_resume_interface.constprop.0.isra.0+0x89/0xd0
>> Aug 19 12:22:39 shalem kernel:  usb_resume_both+0x109/0x180
>> Aug 19 12:22:39 shalem kernel:  ? usb_dev_thaw+0x10/0x10
>> Aug 19 12:22:39 shalem kernel:  usb_resume+0x15/0x60
>> Aug 19 12:22:39 shalem kernel:  dpm_run_callback+0x53/0xc0
>> Aug 19 12:22:39 shalem kernel:  device_resume+0xa8/0x200
>> Aug 19 12:22:39 shalem kernel:  async_resume+0x19/0x30
>> Aug 19 12:22:39 shalem kernel:  async_run_entry_fn+0x30/0x130
>> Aug 19 12:22:39 shalem kernel:  process_one_work+0x2a0/0x600
>> Aug 19 12:22:39 shalem kernel:  worker_thread+0x4f/0x3a0
>> Aug 19 12:22:39 shalem kernel:  ? process_one_work+0x600/0x600
>> Aug 19 12:22:39 shalem kernel:  kthread+0xf5/0x120
>> Aug 19 12:22:39 shalem kernel:  ? kthread_complete_and_exit+0x20/0x20
>> Aug 19 12:22:39 shalem kernel:  ret_from_fork+0x22/0x30
>> Aug 19 12:22:39 shalem kernel:  </TASK>
>> Aug 19 12:22:39 shalem kernel: irq event stamp: 2115
>> Aug 19 12:22:39 shalem kernel: hardirqs last  enabled at (2123): [<ffffffff8418fb52>] vprintk_emit+0x342/0x350
>> Aug 19 12:22:39 shalem kernel: hardirqs last disabled at (2130): [<ffffffff8418fb01>] vprintk_emit+0x2f1/0x350
>> Aug 19 12:22:39 shalem kernel: softirqs last  enabled at (0): [<ffffffff840f5079>] copy_process+0xa49/0x1e50
>> Aug 19 12:22:39 shalem kernel: softirqs last disabled at (0): [<0000000000000000>] 0x0
>> Aug 19 12:22:39 shalem kernel: ---[ end trace 0000000000000000 ]---
>> Aug 19 12:22:39 shalem kernel: DMA-API: Mapped at:
>> Aug 19 12:22:39 shalem kernel:  debug_dma_map_page+0x66/0x100
>> Aug 19 12:22:39 shalem kernel:  dma_map_page_attrs+0x82/0x2d0
>> Aug 19 12:22:39 shalem kernel:  usb_hcd_map_urb_for_dma+0x423/0x500
>> Aug 19 12:22:39 shalem kernel:  usb_hcd_submit_urb+0x9b/0xb80
>> Aug 19 12:22:39 shalem kernel:  usb_start_wait_urb+0x55/0x140
>>
> 
> I'm guessing that the data buffer where hub driver stores port status data
> was already dma mapped when hub driver submitted a new get port status URB.
> usb core tries to map the buffer again at urb subit, triggering this.
> 
> Hub driver allocates one data buffer once, and uses it to store both
> hub status data and port status data. (union &hub->status->port and &hub->status->hub)
> 
> So probably the previous URB (get port status, or get hub status) never successfully
> completed, or for some reason didn't unmap dma at completion.
> 
> Looks like this issue is hit in resume, so maybe somethin went wrong in completing the
> hub URB in suspend?
> 
> Was this easy to reproduce? any external hubs connected?
> 
> One thing to check would be if usbmon shows an uncompleted hub URB when
> a new URB is submitted, triggering this.

Sorry for being (very) slow in following up on this. I have not seen this
for quite a while now, so this seems to be resolved with 6.1 and later.

Regards,

Hans


