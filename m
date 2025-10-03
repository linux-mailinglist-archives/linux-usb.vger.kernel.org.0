Return-Path: <linux-usb+bounces-28890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD3BB7A60
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 19:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E93D4ED270
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 17:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA39C2D8364;
	Fri,  3 Oct 2025 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N53vMnpF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE52D7DE5
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759511086; cv=none; b=cyoKC1PwTXtFort5R1jpn4CbUPC8flYElivCrhULbpqAzp8PmNktTS+9cEOj4qx9d8nLiiecJ86Jt6Yd5jcEgzvux+5Pek0fKuodOSv4fGvP//R48iVOFZFgLMlJOU3jEtOLMOcTQQjtMwqoP1qd1VOYswrjCXedSZmRXAjbTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759511086; c=relaxed/simple;
	bh=h6xvsvIP3x6QGDChCM2MiN6T31mWdt3ulkO+nbihEos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCuX5QbkH78xTfgnsKRb3XLNB5oeHmHYwk6GOlTZhXq7qnMn+P2hi7GzKswp3vaN8U6t0b/nmyR4CqspojcE0EPOy1umihk8//ySt5RzlSi5cfTymkb02tzCDHQWrvxXjker9CSCNh9uuCpa+t97S1qcKfDEJCGAKgWGa1l5gms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N53vMnpF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759511083; x=1791047083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h6xvsvIP3x6QGDChCM2MiN6T31mWdt3ulkO+nbihEos=;
  b=N53vMnpFutxInEDTCI5l6BUGgS+P4k7gsZ95zYBdQI0B2gCvv8qESsTx
   WtIOzD++GGwTyzN9cPbvpxvJDHClwGkGyheVnQw30objDe0WtRa820l+Q
   JmN8kuJyp50+bAJ7ygLxM+KP8PrbgmYWcDy7kBIWDnRgO03ftB8DEON3V
   cU0KdYrjRescZbm+Ruz1WZt5FoZGPPF75j2VRG1yUHuPH+cII424nYVH3
   cFKSjjmPIfSZ2DnHPalFnAoRBqBRJXjfKCxJ2P8IEloe4iyS/xQ/dNgMI
   BWxxuxEupsTG44krd5gbudG2U/Afd1qAl13+DY/49llHyVvDNL3u6UGhO
   Q==;
X-CSE-ConnectionGUID: n9xvs+HUTC+VbbWztJN/NA==
X-CSE-MsgGUID: wshDqHXKSQemyt9lwn88kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64410827"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="64410827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 10:04:42 -0700
X-CSE-ConnectionGUID: MI4ITkLhTGun7HBLnWqDaA==
X-CSE-MsgGUID: sWJhyF4lQT2yim85oAHaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="178620370"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Oct 2025 10:04:39 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4jCv-0004lJ-0A;
	Fri, 03 Oct 2025 17:04:37 +0000
Date: Sat, 4 Oct 2025 01:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: shihao <i.shihao.999@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, shuah@kernel.org,
	linux-usb@vger.kernel.org, shihao <i.shihao.999@gmail.com>
Subject: Re: [PATCH] usb: Fixed protocol translation in
 usb/storage/transport.c
Message-ID: <202510032303.Cpv6a4U7-lkp@intel.com>
References: <20251003083124.17072-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003083124.17072-1-i.shihao.999@gmail.com>

Hi shihao,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.17 next-20251003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shihao/usb-Fixed-protocol-translation-in-usb-storage-transport-c/20251003-163412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251003083124.17072-1-i.shihao.999%40gmail.com
patch subject: [PATCH] usb: Fixed protocol translation in usb/storage/transport.c
config: i386-buildonly-randconfig-004-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032303.Cpv6a4U7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032303.Cpv6a4U7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510032303.Cpv6a4U7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/storage/transport.c: In function 'usb_stor_invoke_transport':
>> drivers/usb/storage/transport.c:735:29: error: 'opcode' undeclared (first use in this function)
     735 |                          if(opcode <= 0x1F)             /* Group 0 */
         |                             ^~~~~~
   drivers/usb/storage/transport.c:735:29: note: each undeclared identifier is reported only once for each function it appears in


vim +/opcode +735 drivers/usb/storage/transport.c

   597	
   598	/*
   599	 * Invoke the transport and basic error-handling/recovery methods
   600	 *
   601	 * This is used by the protocol layers to actually send the message to
   602	 * the device and receive the response.
   603	 */
   604	void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
   605	{
   606		int need_auto_sense;
   607		int result;
   608	
   609		/* send the command to the transport layer */
   610		scsi_set_resid(srb, 0);
   611		result = us->transport(srb, us);
   612	
   613		/*
   614		 * if the command gets aborted by the higher layers, we need to
   615		 * short-circuit all other processing
   616		 */
   617		if (test_bit(US_FLIDX_TIMED_OUT, &us->dflags)) {
   618			usb_stor_dbg(us, "-- command was aborted\n");
   619			srb->result = DID_ABORT << 16;
   620			goto Handle_Errors;
   621		}
   622	
   623		/* if there is a transport error, reset and don't auto-sense */
   624		if (result == USB_STOR_TRANSPORT_ERROR) {
   625			usb_stor_dbg(us, "-- transport indicates error, resetting\n");
   626			srb->result = DID_ERROR << 16;
   627			goto Handle_Errors;
   628		}
   629	
   630		/* if the transport provided its own sense data, don't auto-sense */
   631		if (result == USB_STOR_TRANSPORT_NO_SENSE) {
   632			srb->result = SAM_STAT_CHECK_CONDITION;
   633			last_sector_hacks(us, srb);
   634			return;
   635		}
   636	
   637		srb->result = SAM_STAT_GOOD;
   638	
   639		/*
   640		 * Determine if we need to auto-sense
   641		 *
   642		 * I normally don't use a flag like this, but it's almost impossible
   643		 * to understand what's going on here if I don't.
   644		 */
   645		need_auto_sense = 0;
   646	
   647		/*
   648		 * If we're running the CB transport, which is incapable
   649		 * of determining status on its own, we will auto-sense
   650		 * unless the operation involved a data-in transfer.  Devices
   651		 * can signal most data-in errors by stalling the bulk-in pipe.
   652		 */
   653		if ((us->protocol == USB_PR_CB || us->protocol == USB_PR_DPCM_USB) &&
   654				srb->sc_data_direction != DMA_FROM_DEVICE) {
   655			usb_stor_dbg(us, "-- CB transport device requiring auto-sense\n");
   656			need_auto_sense = 1;
   657		}
   658	
   659		/* Some devices (Kindle) require another command after SYNC CACHE */
   660		if ((us->fflags & US_FL_SENSE_AFTER_SYNC) &&
   661				srb->cmnd[0] == SYNCHRONIZE_CACHE) {
   662			usb_stor_dbg(us, "-- sense after SYNC CACHE\n");
   663			need_auto_sense = 1;
   664		}
   665	
   666		/*
   667		 * If we have a failure, we're going to do a REQUEST_SENSE 
   668		 * automatically.  Note that we differentiate between a command
   669		 * "failure" and an "error" in the transport mechanism.
   670		 */
   671		if (result == USB_STOR_TRANSPORT_FAILED) {
   672			usb_stor_dbg(us, "-- transport indicates command failure\n");
   673			need_auto_sense = 1;
   674		}
   675	
   676		/*
   677		 * Determine if this device is SAT by seeing if the
   678		 * command executed successfully.  Otherwise we'll have
   679		 * to wait for at least one CHECK_CONDITION to determine
   680		 * SANE_SENSE support
   681		 */
   682		if (unlikely((srb->cmnd[0] == ATA_16 || srb->cmnd[0] == ATA_12) &&
   683		    result == USB_STOR_TRANSPORT_GOOD &&
   684		    !(us->fflags & US_FL_SANE_SENSE) &&
   685		    !(us->fflags & US_FL_BAD_SENSE) &&
   686		    !(srb->cmnd[2] & 0x20))) {
   687			usb_stor_dbg(us, "-- SAT supported, increasing auto-sense\n");
   688			us->fflags |= US_FL_SANE_SENSE;
   689		}
   690	
   691		/*
   692		 * A short transfer on a command where we don't expect it
   693		 * is unusual, but it doesn't mean we need to auto-sense.
   694		 */
   695		if ((scsi_get_resid(srb) > 0) &&
   696		    !((srb->cmnd[0] == REQUEST_SENSE) ||
   697		      (srb->cmnd[0] == INQUIRY) ||
   698		      (srb->cmnd[0] == MODE_SENSE) ||
   699		      (srb->cmnd[0] == LOG_SENSE) ||
   700		      (srb->cmnd[0] == MODE_SENSE_10))) {
   701			usb_stor_dbg(us, "-- unexpectedly short transfer\n");
   702		}
   703	
   704		/* Now, if we need to do the auto-sense, let's do it */
   705		if (need_auto_sense) {
   706			int temp_result;
   707			struct scsi_eh_save ses;
   708			int sense_size = US_SENSE_SIZE;
   709			struct scsi_sense_hdr sshdr;
   710			const u8 *scdd;
   711			u8 fm_ili;
   712	
   713			/* device supports and needs bigger sense buffer */
   714			if (us->fflags & US_FL_SANE_SENSE)
   715				sense_size = ~0;
   716	Retry_Sense:
   717			usb_stor_dbg(us, "Issuing auto-REQUEST_SENSE\n");
   718	
   719			scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
   720	
   721			/* Protocol translation per SCSI opcode group */
   722	                switch(us->subclass)
   723	                {
   724	                case USB_SC_UFI:
   725	                case USB_SC_8020:
   726	                case USB_SC_8070:
   727	                case USB_SC_QIC:
   728	                         srb->cmd_len = 12 ;             /* ATAPI/UFI devices always use 12-byte CDBs */
   729	                         break;
   730	
   731	                case USB_SC_RBC:
   732	                case USB_SC_SCSI:
   733	                case USB_SC_CYP_ATACB:                   /* Determine cmd_len based on SCSI opcode group */
   734	
 > 735	                         if(opcode <= 0x1F)             /* Group 0 */
   736	                         {
   737	                                 srb->cmd_len = 6 ;
   738	                         }else if( opcode <= 0x7F)      /* Group 1 & 2 */
   739	                         {
   740	                                 srb->cmd_len = 10;
   741	                         }else if(opcode <= 0x9F )      /* Group 5 */
   742	                         {
   743	                                srb->cmd_len = 16 ;
   744	                         }else if(opcode <=0xBF)        /* Group 6 */
   745	                         {
   746	                                srb->cmd_len = 12 ;
   747	                         }else if( opcode <=0xDF)       /* Group 7 */
   748	                         {
   749	                                srb->cmd_len = 16;
   750	                         }else{
   751	                                ;                       /* Leaving cmd_len  value unchanged  for  0xE0–0xFF vendor-specific*/
   752	
   753	                         }
   754	                        break;
   755	                }
   756	
   757			/* issue the auto-sense command */
   758			scsi_set_resid(srb, 0);
   759			temp_result = us->transport(us->srb, us);
   760	
   761			/* let's clean up right away */
   762			scsi_eh_restore_cmnd(srb, &ses);
   763	
   764			if (test_bit(US_FLIDX_TIMED_OUT, &us->dflags)) {
   765				usb_stor_dbg(us, "-- auto-sense aborted\n");
   766				srb->result = DID_ABORT << 16;
   767	
   768				/* If SANE_SENSE caused this problem, disable it */
   769				if (sense_size != US_SENSE_SIZE) {
   770					us->fflags &= ~US_FL_SANE_SENSE;
   771					us->fflags |= US_FL_BAD_SENSE;
   772				}
   773				goto Handle_Errors;
   774			}
   775	
   776			/*
   777			 * Some devices claim to support larger sense but fail when
   778			 * trying to request it. When a transport failure happens
   779			 * using US_FS_SANE_SENSE, we always retry with a standard
   780			 * (small) sense request. This fixes some USB GSM modems
   781			 */
   782			if (temp_result == USB_STOR_TRANSPORT_FAILED &&
   783					sense_size != US_SENSE_SIZE) {
   784				usb_stor_dbg(us, "-- auto-sense failure, retry small sense\n");
   785				sense_size = US_SENSE_SIZE;
   786				us->fflags &= ~US_FL_SANE_SENSE;
   787				us->fflags |= US_FL_BAD_SENSE;
   788				goto Retry_Sense;
   789			}
   790	
   791			/* Other failures */
   792			if (temp_result != USB_STOR_TRANSPORT_GOOD) {
   793				usb_stor_dbg(us, "-- auto-sense failure\n");
   794	
   795				/*
   796				 * we skip the reset if this happens to be a
   797				 * multi-target device, since failure of an
   798				 * auto-sense is perfectly valid
   799				 */
   800				srb->result = DID_ERROR << 16;
   801				if (!(us->fflags & US_FL_SCM_MULT_TARG))
   802					goto Handle_Errors;
   803				return;
   804			}
   805	
   806			/*
   807			 * If the sense data returned is larger than 18-bytes then we
   808			 * assume this device supports requesting more in the future.
   809			 * The response code must be 70h through 73h inclusive.
   810			 */
   811			if (srb->sense_buffer[7] > (US_SENSE_SIZE - 8) &&
   812			    !(us->fflags & US_FL_SANE_SENSE) &&
   813			    !(us->fflags & US_FL_BAD_SENSE) &&
   814			    (srb->sense_buffer[0] & 0x7C) == 0x70) {
   815				usb_stor_dbg(us, "-- SANE_SENSE support enabled\n");
   816				us->fflags |= US_FL_SANE_SENSE;
   817	
   818				/*
   819				 * Indicate to the user that we truncated their sense
   820				 * because we didn't know it supported larger sense.
   821				 */
   822				usb_stor_dbg(us, "-- Sense data truncated to %i from %i\n",
   823					     US_SENSE_SIZE,
   824					     srb->sense_buffer[7] + 8);
   825				srb->sense_buffer[7] = (US_SENSE_SIZE - 8);
   826			}
   827	
   828			scsi_normalize_sense(srb->sense_buffer, SCSI_SENSE_BUFFERSIZE,
   829					     &sshdr);
   830	
   831			usb_stor_dbg(us, "-- Result from auto-sense is %d\n",
   832				     temp_result);
   833			usb_stor_dbg(us, "-- code: 0x%x, key: 0x%x, ASC: 0x%x, ASCQ: 0x%x\n",
   834				     sshdr.response_code, sshdr.sense_key,
   835				     sshdr.asc, sshdr.ascq);
   836	#ifdef CONFIG_USB_STORAGE_DEBUG
   837			usb_stor_show_sense(us, sshdr.sense_key, sshdr.asc, sshdr.ascq);
   838	#endif
   839	
   840			/* set the result so the higher layers expect this data */
   841			srb->result = SAM_STAT_CHECK_CONDITION;
   842	
   843			scdd = scsi_sense_desc_find(srb->sense_buffer,
   844						    SCSI_SENSE_BUFFERSIZE, 4);
   845			fm_ili = (scdd ? scdd[3] : srb->sense_buffer[2]) & 0xA0;
   846	
   847			/*
   848			 * We often get empty sense data.  This could indicate that
   849			 * everything worked or that there was an unspecified
   850			 * problem.  We have to decide which.
   851			 */
   852			if (sshdr.sense_key == 0 && sshdr.asc == 0 && sshdr.ascq == 0 &&
   853			    fm_ili == 0) {
   854				/*
   855				 * If things are really okay, then let's show that.
   856				 * Zero out the sense buffer so the higher layers
   857				 * won't realize we did an unsolicited auto-sense.
   858				 */
   859				if (result == USB_STOR_TRANSPORT_GOOD) {
   860					srb->result = SAM_STAT_GOOD;
   861					srb->sense_buffer[0] = 0x0;
   862				}
   863	
   864				/*
   865				 * ATA-passthru commands use sense data to report
   866				 * the command completion status, and often devices
   867				 * return Check Condition status when nothing is
   868				 * wrong.
   869				 */
   870				else if (srb->cmnd[0] == ATA_16 ||
   871						srb->cmnd[0] == ATA_12) {
   872					/* leave the data alone */
   873				}
   874	
   875				/*
   876				 * If there was a problem, report an unspecified
   877				 * hardware error to prevent the higher layers from
   878				 * entering an infinite retry loop.
   879				 */
   880				else {
   881					srb->result = DID_ERROR << 16;
   882					if ((sshdr.response_code & 0x72) == 0x72)
   883						srb->sense_buffer[1] = HARDWARE_ERROR;
   884					else
   885						srb->sense_buffer[2] = HARDWARE_ERROR;
   886				}
   887			}
   888		}
   889	
   890		/*
   891		 * Some devices don't work or return incorrect data the first
   892		 * time they get a READ(10) command, or for the first READ(10)
   893		 * after a media change.  If the INITIAL_READ10 flag is set,
   894		 * keep track of whether READ(10) commands succeed.  If the
   895		 * previous one succeeded and this one failed, set the REDO_READ10
   896		 * flag to force a retry.
   897		 */
   898		if (unlikely((us->fflags & US_FL_INITIAL_READ10) &&
   899				srb->cmnd[0] == READ_10)) {
   900			if (srb->result == SAM_STAT_GOOD) {
   901				set_bit(US_FLIDX_READ10_WORKED, &us->dflags);
   902			} else if (test_bit(US_FLIDX_READ10_WORKED, &us->dflags)) {
   903				clear_bit(US_FLIDX_READ10_WORKED, &us->dflags);
   904				set_bit(US_FLIDX_REDO_READ10, &us->dflags);
   905			}
   906	
   907			/*
   908			 * Next, if the REDO_READ10 flag is set, return a result
   909			 * code that will cause the SCSI core to retry the READ(10)
   910			 * command immediately.
   911			 */
   912			if (test_bit(US_FLIDX_REDO_READ10, &us->dflags)) {
   913				clear_bit(US_FLIDX_REDO_READ10, &us->dflags);
   914				srb->result = DID_IMM_RETRY << 16;
   915				srb->sense_buffer[0] = 0;
   916			}
   917		}
   918	
   919		/* Did we transfer less than the minimum amount required? */
   920		if ((srb->result == SAM_STAT_GOOD || srb->sense_buffer[2] == 0) &&
   921				scsi_bufflen(srb) - scsi_get_resid(srb) < srb->underflow)
   922			srb->result = DID_ERROR << 16;
   923	
   924		last_sector_hacks(us, srb);
   925		return;
   926	
   927		/*
   928		 * Error and abort processing: try to resynchronize with the device
   929		 * by issuing a port reset.  If that fails, try a class-specific
   930		 * device reset.
   931		 */
   932	  Handle_Errors:
   933	
   934		/*
   935		 * Set the RESETTING bit, and clear the ABORTING bit so that
   936		 * the reset may proceed.
   937		 */
   938		scsi_lock(us_to_host(us));
   939		set_bit(US_FLIDX_RESETTING, &us->dflags);
   940		clear_bit(US_FLIDX_ABORTING, &us->dflags);
   941		scsi_unlock(us_to_host(us));
   942	
   943		/*
   944		 * We must release the device lock because the pre_reset routine
   945		 * will want to acquire it.
   946		 */
   947		mutex_unlock(&us->dev_mutex);
   948		result = usb_stor_port_reset(us);
   949		mutex_lock(&us->dev_mutex);
   950	
   951		if (result < 0) {
   952			scsi_lock(us_to_host(us));
   953			usb_stor_report_device_reset(us);
   954			scsi_unlock(us_to_host(us));
   955			us->transport_reset(us);
   956		}
   957		clear_bit(US_FLIDX_RESETTING, &us->dflags);
   958		last_sector_hacks(us, srb);
   959	}
   960	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

